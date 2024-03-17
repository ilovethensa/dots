{ inputs, outputs, lib, config, pkgs, ... }: {

  # Import modules and configuration pieces
  imports = [
    ./hardware-configuration.nix
    ./../common/users.nix
    ./../common/openssh.nix
    ./../common/optimizations.nix
    ./services/jellyfin.nix
    ./services/jellyseerr.nix
    ./services/cloudflared-web.nix
    ./services/qbittorrent.nix
    ./services/n8n.nix
    ./services/unmanic.nix
    ./services/homepage.nix
    ./services/glances.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.sops-nix.nixosModules.sops
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

  # Bootloader configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking and system configurations
  networking.hostName = "server"; # Define hostname
  time.timeZone = "Europe/Sofia"; # Set timezone

  # OpenSSH configuration
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
    settings.KbdInteractiveAuthentication = true;
  };

  # Disable the firewall
  networking.firewall.enable = false;

  virtualisation.oci-containers.backend = "podman";

  # Persistence configuration
  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/nixos"
      "/etc/NetworkManager/system-connections"
      "/srv"
      "/var/lib/jellyfin"
      "/etc/jellyfin"
      "/var/lib/docker"
      "/var/lib/containers"
      {
        directory = "/home/tht";
        user = "tht";
      }
      {
        directory = "/root";
        user = "root";
      }

    ];
    files = [
      "/etc/machine-id"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
    ];
  };
  sops.defaultSopsFile = ./../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/tht/.config/sops/age/keys.txt";

  # System state version
  system.stateVersion = "23.05";
}
