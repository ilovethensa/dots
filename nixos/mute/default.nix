{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # Import modules and configuration pieces
  imports = [
    ./hardware-configuration.nix
    ./../common/adb.nix
    ./../common/battery.nix
    ./../common/gpus/intel
    ./../common/sound.nix
    ./../common/users.nix
    ./../common/home.nix
    ./../common/openssh.nix
    ./../common/nix-ld.nix
    ./../common/desktops/gnome
    ./../common/boot.nix
    ./../common/misc.nix
    ./../common/persist.nix
    ./../common/gaming.nix
    ./../common/virtualization.nix
    ./../common/sops.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.sops-nix.nixosModules.sops
  ];

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
  # Networking and system configurations
  networking.hostName = "mute"; # Define hostname
  networking.networkmanager.enable = true; # Enable NetworkManager

  environment.systemPackages = with pkgs; [
    aircrack-ng
    wifite2
    hcxtools
    hcxdumptool
    qemu
    qbittorrent
  ];

  # System state version
  system.stateVersion = "23.05";
}
