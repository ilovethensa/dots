{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  spicetify-nix,
  ...
}: {
  # Import modules and configuration pieces
  imports = [
    ./hardware-configuration.nix
    ./../common/boot.nix
    ./../common/sound.nix
    ./../common/users.nix
    ./../common/amd.nix
    ./../common/gaming.nix
    ./../common/home.nix
    ./../common/openssh.nix
    ./../common/nix-ld.nix
    ./../common/desktops/gnome.nix
    ./../common/networking.nix
    ./../common/misc.nix
  ];

  # Networking and system configurations
  networking.hostName = "viper"; # Set hostname
  boot.kernelParams = ["mitigations=off"]; # Kernel parameters
  hardware.bluetooth.enable = false; # Disable Bluetooth

  environment.systemPackages = with pkgs; [
    krita
    pywhat
  ];
  services.flatpak.enable = true;

  # System state version
  system.stateVersion = "23.05";
}