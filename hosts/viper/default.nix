{
  inputs,
  pkgs,
  ...
}: {
  # Import modules and configuration pieces
  imports = [
    ./hardware-configuration.nix
    ./../../nixos/tht.nix
    ./../../nixos/options
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
    adb = true;
    battery = true;
    gaming = true;
    appimage = true;

    nix-ld = true;
    persist = true;
    sound = true;
    amd = true;
    virtualization = true;
    gnome = true;
  };
  services.flatpak.enable = true;
  programs.command-not-found.enable = false;
  # System state version
  system.stateVersion = "23.05";
}
