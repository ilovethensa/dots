{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  secrets,
  ...
}: let
  servicesConfig = {
    jellyfin = {port = 8096;};
    transmission = {port = 9091;};
    radarr = {port = 7878;};
    sonarr = {port = 8989;};
    bazarr = {port = 6767;};
    prowlarr = {port = 9696;};
    jellyseerr = {port = 5055;};
  };
in {
  # Import modules and configuration pieces
  imports = [
    ./hardware-configuration.nix
    ./../common/users.nix
    ./../common/openssh.nix
    ./../common/nix-ld.nix
    ./../common/boot.nix
    ./../common/misc.nix
    (import ./services/arr.nix {inherit config lib pkgs servicesConfig secrets;})
    ./services/cloudflared-web.nix
    #./services/qbittorrent.nix
    #./services/n8n.nix
    #./services/unmanic.nix
    ./services/homepage.nix
    #./services/glances.nix
    ./services/scrutiny.nix
    #./services/invidious.nix
    #./services/libreddit.nix
    #./services/cron.nix
    ./services/mindustry.nix
    ./services/playit.nix
    ./services/glances.nix
    #./services/nextcloud.nix
    ./services/nginx.nix
    ./avahi.nix
    ./services/jellyseerr.nix
    inputs.home-manager.nixosModules.home-manager
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

  virtualisation.oci-containers.backend = "podman";
  environment.systemPackages = with pkgs; [
    jdk17
    playit
    git
  ];
  # Persistence configuration
  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/nixos"
      "/etc/NetworkManager/system-connections"
      #"/srv"
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
