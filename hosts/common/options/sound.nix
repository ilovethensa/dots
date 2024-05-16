{
  pkgs,
  lib,
  config,
  ...
}: let
  service = "tht";
  cfg = config.services.${service};
in {
  options.services.${service} = {
    sound = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.sound {
    imports = [
      inputs.nix-gaming.nixosModules.pipewireLowLatency
    ];

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
