{
  lib,
  config,
  inputs,
  ...
}: let
  service = "tht";
  cfg = config.services.${service};
in {
  imports = [
    inputs.nix-gaming.nixosModules.pipewireLowLatency
  ];
  options.services.${service} = {
    sound = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.sound {
    # Enable sound with pipewire.
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      lowLatency = {
        enable = true;
        quantum = 64;
        rate = 48000;
      };
    };
  };
}
