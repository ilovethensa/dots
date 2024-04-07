{ pkgs, lib, config, ... }:
{
  virtualisation.oci-containers.containers."prowlarr" = {
    image = "lscr.io/linuxserver/prowlarr:latest";
    autoStart = true;
    volumes = [
      "/srv/AppData/prowlarr:/config"
      "/srv/Media/Movies:/movies"
      "/srv/Media/Tv:/tv"
    ];
    ports = [
      "9696:9696"
    ];

  };
}
