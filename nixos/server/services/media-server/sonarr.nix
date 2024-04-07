{ pkgs, lib, config, ... }:
{
  virtualisation.oci-containers.containers."sonarr" = {
    image = "lscr.io/linuxserver/sonarr:latest";
    autoStart = true;
    volumes = [
      "/srv/AppData/sonarr:/config"
      "/srv/Media/Movies:/movies"
      "/srv/Media/Tv:/tv"
      "/srv/Media/Downloads:/downloads"
    ];
    ports = [
      "8989:8989"
    ];

  };
}
