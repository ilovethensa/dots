{ inputs, outputs, lib, config, pkgs, ... }: {

  # Import modules and configuration pieces
  imports = [
    ./hardware-configuration.nix
    #./../common/kde.nix
    ./../common/sound.nix
    ./../common/users.nix
    ./../common/home.nix
    ./../common/openssh.nix
    ./../common/optimizations.nix
    ./../common/nix-ld.nix
    ./../common/desktops/gnome.nix
    ./disko.nix
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

  # Networking and system configurations
  networking.hostName = "thinkpad"; # Define hostname
  boot.kernelParams = [ "mitigations=off" ]; # Set kernel parameters
  networking.networkmanager.enable = true; # Enable NetworkManager

  # Bootloader configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # System state version
  system.stateVersion = "23.05";
}
