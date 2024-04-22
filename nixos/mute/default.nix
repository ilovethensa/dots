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
    #./../common/kde.nix
    ./../common/sound.nix
    ./../common/users.nix
    ./../common/home.nix
    ./../common/openssh.nix
    ./../common/nix-ld.nix
    ./../common/desktops/sway
    ./../common/boot.nix
    ./../common/misc.nix
    inputs.home-manager.nixosModules.home-manager
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
    airgeddon
    wavemon
  ];
  services.fwupd.enable = true;
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
  powerManagement.powertop.enable = true;
  # System state version
  system.stateVersion = "23.05";
}
