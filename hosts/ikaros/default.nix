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
    #./services/glance.nix
    ./services/cron.nix
    #./services/wireguard.nix
    #./services/homepage.nix
    #./services/minecraft.nix
    #./services/grafana.nix
    #./services/n8n.nix
    #./services/miniflux.nix
    #./services/glances.nix
    #./services/changedetection.nix
    #./services/speedtest-tracker.nix
    #./services/syncthing.nix
    #./services/photoprism.nix
    #./services/nextcloud.nix
    #./services/kasm.nix # Disabled until i upgrade my server
    ./services/unmanic.nix
    ./services/rimgo.nix
    ./services/libreddit.nix
    ./services/mail.nix
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
  services.fail2ban = {
    enable = false;
    # Ban IP after 5 failures
    maxretry = 5;
    ignoreIP = [
      # Whitelist some subnets
      "10.0.0.0/8"
      "172.16.0.0/12"
      "192.168.0.0/16"
      "8.8.8.8" # whitelist a specific IP
      "nixos.wiki" # resolve the IP via DNS
    ];
    bantime = "24h"; # Ban IPs for one day on the first ban
    bantime-increment = {
      enable = true; # Enable increment of bantime after each violation
      multipliers = "1 2 4 8 16 32 64";
      maxtime = "168h"; # Do not ban for more than 1 week
      overalljails = true; # Calculate the bantime based on all the violations
    };
    jails = {
      apache-nohome-iptables.settings = {
        # Block an IP address if it accesses a non-existent
        # home directory more than 5 times in 10 minutes,
        # since that indicates that it's scanning.
        filter = "apache-nohome";
        action = ''iptables-multiport[name=HTTP, port="http,https"]'';
        logpath = "/var/log/httpd/error_log*";
        backend = "auto";
        findtime = 600;
        bantime = 600;
        maxretry = 5;
      };
    };
  };

  # Networking and system configurations
  networking.hostName = "ikaros"; # Define hostname

  environment.systemPackages = with pkgs; [
    jdk17
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
