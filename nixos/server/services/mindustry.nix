{ pkgs, lib, config, ... }:
{
  virtualisation.oci-containers.containers."mindustry" = {
    image = "anderpuqing/mindustry:latest";
    autoStart = true;
    volumes = [
      "/srv/AppData/mindustry:/mindustry/config"
    ];
    ports = [
      "6567:6567/tcp"
      "6567:6567/udp"
    ];
  };
}
