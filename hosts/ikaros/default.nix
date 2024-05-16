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
    ./../common/gpus/intel
    ./../common/users.nix
    ./../common/openssh.nix
    ./../common/nix-ld.nix
    ./../common/boot.nix
    ./../common/misc.nix
    ./../common/persist.nix
    ./../common/sops.nix
    ./../common/options
    ./services/arr.nix
    ./services/cloudflared-web.nix
    ./services/mindustry.nix
    ./services/playit.nix
    ./services/caddy.nix
    ./services/jellyseerr.nix
    ./services/glance.nix
    ./services/cron.nix
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
  services.tht.virtualization = true;
  # System state version
  system.stateVersion = "23.05";
}
