{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  # Import modules and configuration pieces
  imports = [
    ./hardware-configuration.nix
    ./wireguard.nix
    ./../../nixos/tht.nix
    ./../../nixos/options
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
    mullvad-browser
    tor-browser
    rage
  ];
  services.tht = {
    adb = true;
    battery = true;
    gaming = true;
    appimage = true;
    nix-ld = true;
    persist = true;
    sound = true;
    intel = true;
    virtualization = true;
    gnome = true;
  };
  # System state version
  system.stateVersion = "23.05";
}
