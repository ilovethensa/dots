{...}: {
  nixarr = {
    enable = true;
    mediaDir = "/mnt/media";
    stateDir = "/media/data";

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
}
