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
    nixPath = [ "/etc/nix/path" ];
    registry = (lib.mapAttrs (_: flake: { inherit flake; }))
      ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  };

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
