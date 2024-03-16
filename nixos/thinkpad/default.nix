{ inputs, outputs, lib, config, pkgs, ... }: {

  # Import modules and configuration pieces
  imports = [
    ./hardware-configuration.nix
    ./power.nix
    #./../common/kde.nix
    ./../common/sound.nix
    ./../common/users.nix
    ./../common/home.nix
    ./../common/openssh.nix
    ./../common/optimizations.nix
    ./../common/nix-ld.nix
    ./../common/sddm.nix
    ./../common/hyprland.nix
    inputs.home-manager.nixosModules.home-manager
  ];

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
    nixPath = [ "/etc/nix/path" ]; # Define nix path
    registry = (lib.mapAttrs (_: flake: { inherit flake; })) ((lib.filterAttrs (_: lib.isType "flake")) inputs);
  };

  # Networking and system configurations
  networking.hostName = "thinkpad"; # Define hostname
  boot.kernelParams = [ "mitigations=off" ]; # Set kernel parameters
  networking.networkmanager.enable = true; # Enable NetworkManager

  # Bootloader configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  programs.hyprland.enable = true;
  # System state version
  system.stateVersion = "23.05";
}
