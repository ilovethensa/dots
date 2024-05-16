{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  sops,
  ...
}: {
  imports = [
    ./adb.nix
    ./battery.nix
    ./boot.nix
    ./gaming.nix
    ./home.nix
    #./misc.nix
    ./openssh.nix
    ./persist.nix
    ./security.nix
    ./sound.nix
    ./virtualization.nix
    ./gpu
    ./desktop
  ];
  networking.firewall.enable = false;
  time.timeZone = "Europe/Sofia";
  sops.defaultSopsFile = ./../../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.sshKeyPaths = ["/home/tht/.ssh/id_ed25519"];
  sops.age.keyFile = "/home/tht/.config/sops/age/keys.txt";
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
  programs.command-not-found.enable = false;
}
