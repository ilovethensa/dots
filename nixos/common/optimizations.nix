{ inputs, outputs, lib, config, pkgs, ... }: {
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    optimise = {
      automatic = true;
      dates = [ "03:45" ];
    };
  };
  # Disables it for faster boot times
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;

  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L"
    ];
    dates = "02:00";
    randomizedDelaySec = "45min";
  };
  # Nixpkgs configuration
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
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
    nixPath = [ "/etc/nix/path" ];
    registry = (lib.mapAttrs (_: flake: { inherit flake; })) ((lib.filterAttrs (_: lib.isType "flake")) inputs);
  };
  environment.etc =
    lib.mapAttrs'
      (name: value: {
        name = "nix/path/${name}";
        value.source = value.flake;
      })
      config.nix.registry;

}
