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
    ./../common/users.nix
    ./../common/openssh.nix
    ./../common/nix-ld.nix
    ./../common/boot.nix
    ./../common/misc.nix
    ./../common/persist.nix
    ./../common/sops.nix
    ./services/arr.nix
    ./services/cloudflared-web.nix
    #./services/qbittorrent.nix
    #./services/n8n.nix
    #./services/unmanic.nix
    #./services/homepage.nix
    #./services/glances.nix
    ./services/scrutiny.nix
    #./services/invidious.nix
    #./services/libreddit.nix
    #./services/cron.nix
    ./services/mindustry.nix
    ./services/playit.nix
    ./services/glances.nix
    #./services/nextcloud.nix
    ./services/caddy.nix
    ./avahi.nix
    ./services/jellyseerr.nix
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
  networking.hostName = "ikaros"; # Define hostname
  virtualisation = {
    oci-containers.backend = "podman";
    podman = {
      enable = true;
      dockerCompat = true;
      dockerSocket.enable = true;
      autoPrun/var/lib/jellyseerr/e.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    jdk17
    playit
    git
  ];
  # Persistence configuration
  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [
      "/var/lib/jellyfin"
      "/etc/jellyfin"
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
      #"/etc/machine-id"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
    ];
  };
  # System state version
  system.stateVersion = "23.05";
}
