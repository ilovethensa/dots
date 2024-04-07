{ pkgs, lib, config, ... }:
{
  virtualisation.oci-containers.containers."bazarr" = {
    image = "lscr.io/linuxserver/bazarr:latest";
    autoStart = true;
    volumes = [
      "/srv/AppData/bazarr:/config"
      "/srv/Media/Movies:/movies"
      "/srv/Media/Tv:/tv"
    ];
    ports = [
      "6767:6767"
    ];

  };
}
