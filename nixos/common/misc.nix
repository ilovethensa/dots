{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  spicetify-nix,
  ...
}: {
  system.autoUpgrade = {
    allowReboot = true;
    dates = "04:00";
    enable = true;
    flake = "github:ilovethensa/dots";
    randomizedDelaySec = "1h";
    rebootWindow = {
      lower = "00:00";
      upper = "06:00";
    };
  };
  # Disables it for faster boot times
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;

  # Nixpkgs configuration
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
    ];
    config = {
      allowUnfree = true; # Enable unfree packages
    };
  };
  # Nix settings
  nix = {
    settings = {
      experimental-features = "nix-command flakes"; # Enable flakes and 'nix' command
      auto-optimise-store = true; # Deduplicate and optimize nix store
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    optimise = {
      automatic = true;
      dates = ["03:45"];
    };

    nixPath = ["/etc/nix/path"];
    registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);
  };
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;
}
