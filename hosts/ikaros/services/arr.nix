{
  pkgs,
  lib,
  config,
  ...
}: {
  nixarr = {
    enable = true;
    mediaDir = "/srv/Media";
    stateDir = "/srv/data";

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
