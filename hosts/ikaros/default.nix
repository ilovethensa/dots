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
    ./services/arr.nix
    ./services/cloudflared-web.nix
    #./services/mindustry.nix
    #./services/playit.nix
    ./services/caddy.nix
    ./services/jellyseerr.nix
    ./services/glance.nix
    ./services/cron.nix
    #./services/wireguard.nix
    ./services/homepage.nix
    #./services/minecraft.nix
    #./services/grafana.nix
    #./services/n8n.nix
    #./services/miniflux.nix
    ./services/glances.nix
    #./services/changedetection.nix
    #./services/speedtest-tracker.nix
    #./services/syncthing.nix
    #./services/photoprism.nix
    #./services/nextcloud.nix
    #./services/kasm.nix # Disabled until i upgrade my server
    ./services/unmanic.nix
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
  services.tht = {
    intel = true;
    home = false;
    ssh = true;
    persist = true;
    virtualization = false;
  };
  virtualisation = {
    oci-containers.backend = "docker";
    docker = {
      enable = true;
      storageDriver = "btrfs";
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };
  # Networking and system configurations
  networking.hostName = "ikaros"; # Define hostname

  environment.systemPackages = with pkgs; [
    jdk17
    playit
    git
    btop
  ];
  #networking.wireguard.enable = true;
  # Persistence configuration
  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [
      "/var/lib"
      "/etc/jellyfin"
      "/home"
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
