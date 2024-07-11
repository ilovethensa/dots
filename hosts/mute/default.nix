{ inputs
, outputs
, pkgs
, ...
}: {
  # Import modules and configuration pieces
  imports = [
    ./hardware-configuration.nix
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
    brave
    rage
    flare-signal
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
    hyprland = true;
    gnome = false;
  };
  boot = {
    initrd.systemd.enable = true;
    kernelParams = [
      "processor.max_cstate=1"
      "i915.enable_dc=0"
      "intel_idle.max_cstate=2"
      "i915.enable_psr=0"
      "i915.enable_rc6=0"
      "i915.preliminary_hw_support=1"
    ];
  };
  # System state version
  system.stateVersion = "23.05";
}
