{ inputs, outputs, lib, config, pkgs, ... }: {
  # Import modules and configuration pieces
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./../common/greetd.nix
    ./../common/sound.nix
    ./../common/users.nix
    ./../common/amd.nix
    ./../common/gaming.nix
    ./../common/home.nix
    ./../common/openssh.nix
    ./../common/optimizations.nix
    ./../common/nix-ld.nix
    ./../common/hyprland.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  # Networking and system configurations
  networking.hostName = "desktop"; # Set hostname
  boot.kernelParams = [ "mitigations=off" ]; # Kernel parameters
  hardware.bluetooth.enable = false; # Disable Bluetooth

  environment.systemPackages = with pkgs; [
    krita
  ];

  # System state version
  system.stateVersion = "23.05";
}
