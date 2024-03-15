{ pkgs, lib, config, ... }:
{
  virtualisation.oci-containers.containers."qbittorrent" = {
    image = "lscr.io/linuxserver/qbittorrent:latest";
    autoStart = true;
    volumes = [
      "/AppData/qbittorrent:/config"
      "/srv:/srv"
    ];
    ports = [
      "8080:8080"
      "6881:6881"
      "6881:6881/udp"
    ];

  };
}
