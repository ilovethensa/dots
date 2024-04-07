{ pkgs, lib, config, ... }:
{
  virtualisation.oci-containers.containers."radarr" = {
    image = "lscr.io/linuxserver/radarr:latest";
    autoStart = true;
    volumes = [
      "/srv/AppData/radarr:/config"
      "/srv/Media/Movies:/movies"
      "/srv/Media/Tv:/tv"
      "/srv/Media/Downloads:/downloads"
    ];
    ports = [
      "7878:7878"
    ];

  };
}
