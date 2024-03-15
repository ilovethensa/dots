{ inputs, outputs, lib, config, pkgs, ... }: {
  # Import modules and configuration pieces
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./../common/sddm.nix
    ./../common/sound.nix
    ./../common/users.nix
    ./../common/amd.nix
    ./../common/gaming.nix
    ./../common/home.nix
    ./../common/openssh.nix
    ./../common/optimizations.nix
    ./../common/nix-ld.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  # Nixpkgs configuration
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true; # Enable unfree packages
    };
  };

  # Nix settings
  nix = {
    settings = {
      experimental-features = "nix-command flakes"; # Enable flakes and 'nix' command
      auto-optimise-store = true; # Deduplicate and optimize nix store
    };
    nixPath = [ "/etc/nix/path" ]; # Define nix path
    registry = (lib.mapAttrs (_: flake: { inherit flake; })) ((lib.filterAttrs (_: lib.isType "flake")) inputs);
  };

  # Networking and system configurations
  networking.hostName = "desktop"; # Set hostname
  boot.kernelParams = [ "mitigations=off" ]; # Kernel parameters
  hardware.bluetooth.enable = false; # Disable Bluetooth
  programs.hyprland.enable = true; # Enable Hyprland program
  system.environment = {
    GDK_BACKEND = "wayland,x11";
    QT_QPA_PLATFORM = "wayland;xcb";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    NIXOS_OZONE_WL = "1";
  };

  # System state version
  system.stateVersion = "23.05";
}
