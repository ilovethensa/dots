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
    ./../common/gpus/amd
    ./../common/gaming.nix
    ./../common/home.nix
    ./../common/openssh.nix
    ./../common/nix-ld.nix
    ./../common/desktops/gnome
    ./../common/networking.nix
    ./../common/misc.nix
    ./../common/security.nix
    ./../common/persist.nix
    inputs.sops-nix.nixosModules.sops
  ];

  # Networking and system configurations
  networking.hostName = "viper"; # Set hostname
  boot.kernelParams = ["mitigations=off"]; # Kernel parameters
  hardware.bluetooth.enable = false; # Disable Bluetooth

  environment.systemPackages = with pkgs; [
    krita
    pywhat
    distrobox
    davinci-resolve
    quickemu
    qemu
    masscan-mc
  ];
  services.tht = {
    virtualization.enable = true;
  };
  services.flatpak.enable = true;
  programs.command-not-found.enable = false;
  # System state version
  system.stateVersion = "23.05";
}
