{
  inputs,
  outputs,
  pkgs,
  ...
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
  };
  boot = {
    initrd.systemd.enable = true;
    plymouth = {
      enable = true;
      #theme = "matrix";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = ["lone"];
        })
        plymouth-matrix-theme
      ];
      logo = pkgs.fetchurl {
        url = "https://i.imgur.com/OegRAKB.png";
        sha256 = "1z32vg6mkqygg8hs8xlsnz3zbgqbmc47kkrlx151hd7imyjwpv1w";
      };
    };

    # Enable "Silent Boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.timeout = 0;
  };
  # System state version
  system.stateVersion = "23.05";
}
