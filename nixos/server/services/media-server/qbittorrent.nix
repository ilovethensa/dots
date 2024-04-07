{ pkgs, lib, config, ... }:
{
  virtualisation.oci-containers.containers."qbittorrent" = {
    image = "lscr.io/linuxserver/qbittorrent:latest";
    autoStart = true;
    volumes = [
      "/srv/AppData/qbittorrent:/config"
      "/srv:/srv"
      "/srv/Media/Movies:/movies"
      "/srv/Media/Tv:/tv"
      "/srv/Media/Downloads:/downloads"

    ];
    ports = [
      "8080:8080"
      "6881:6881"
      "6881:6881/udp"
    ];

  };
}
