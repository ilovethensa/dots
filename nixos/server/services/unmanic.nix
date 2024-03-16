{ pkgs, lib, config, ... }:
{
  virtualisation.oci-containers.containers."unmanic" = {
    image = "josh5/unmanic:latest";
    autoStart = true;
    volumes = [
      "/srv/AppData/unmanic/data:/config"
      "/srv/Media:/library"
      "/srv/AppData/unmanic/cache:/tmp/unmanic"
    ];
    ports = [
      "8888:8888"
    ];

    extraOptions = [ "--device=/dev/dri" ];
  };
}
