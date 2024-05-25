{...}: {
  nixarr = {
    enable = true;
    mediaDir = "/mnt/media";
    stateDir = "/mnt/data";

    jellyfin.enable = true;
    transmission = {
      enable = true;
      peerPort = 50000;
    };
    bazarr.enable = true;
    prowlarr.enable = true;
    radarr.enable = true;
    sonarr.enable = true;
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
