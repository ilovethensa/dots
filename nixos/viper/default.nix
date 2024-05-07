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
    ./../common/desktops/gnome
    ./../common/networking.nix
    ./../common/misc.nix
    ./../common/security.nix
    ./../common/persist.nix
    ./../common/virtualization.nix
  ];

  # Networking and system configurations
  networking.hostName = "viper"; # Set hostname
  boot.kernelParams = ["mitigations=off"]; # Kernel parameters
  hardware.bluetooth.enable = false; # Disable Bluetooth
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [
    krita
    pywhat
    distrobox
    davinci-resolve
    quickemu
    qemu
    masscan-mc
  ];
  services.flatpak.enable = true;
  programs.command-not-found.enable = false;
  # System state version
  system.stateVersion = "23.05";
}
