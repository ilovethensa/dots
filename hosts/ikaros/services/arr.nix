{...}: {
  nixarr = {
    enable = true;
    mediaDir = "/mnt/media";
    stateDir = "/mnt/data";

    jellyfin = {
      enable = true;
      openFirewall = true;
    };
    transmission = {
      enable = true;
      peerPort = 50000;
      openFirewall = true;
    };
    bazarr = {
      enable = true;
      openFirewall = true;
    };
    prowlarr = {
      enable = true;
      openFirewall = true;
    };
    radarr = {
      enable = true;
      openFirewall = true;
    };
    sonarr = {
      enable = true;
      openFirewall = true;
    };
    lidarr = {
      enable = true;
      openFirewall = true;
    };
  };
  networking.firewall.allowedTCPPorts = [
    3000 # Transmission
    50000 # Peer port
    7878 # Radarr
    8989 # Sonarr
    9696 # Prowlarr
    6767 # Bazarr
    8096 # Jellyfin
  ];
}
