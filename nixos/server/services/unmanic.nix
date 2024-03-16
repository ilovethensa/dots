{ pkgs, lib, config, ... }:
{
  virtualisation.oci-containers.containers."unmanic" = {
    image = "josh5/unmanic:latest";
    autoStart = true;
    volumes = [
      "/srv/AppData/unmanic:/config"
      "/srv/Media:/library"
      "/tmp/unmanic:/tmp/unmanic"
    ];
    ports = [
      "8888:8888"
    ];

    extraOptions = [ "--device=/dev/dri" ];
  };
}
