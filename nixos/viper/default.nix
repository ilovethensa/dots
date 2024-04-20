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
    ./../common/desktops/sway
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
    distrobox
    davinci-resolve
    clinfo
  ];
  services.flatpak.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    dockerSocket.enable = true;
    autoPrune.enable = true;
  };
  virtualisation.containers = {
    enable = true;
  };
  environment.etc.machine-id = {
    text = ''
      12345678901234567890123456789012
    '';
  };
  programs.command-not-found.enable = false;
  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/nixos"
      "/etc/NetworkManager/system-connections"
    ];
  };
  # System state version
  system.stateVersion = "23.05";
}
