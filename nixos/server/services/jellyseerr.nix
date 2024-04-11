{ pkgs, lib, config, ... }:
{
  virtualisation.oci-containers.containers."jellyseerr" = {
    image = "fallenbagel/jellyseerr:latest";
    autoStart = true;
    volumes = [
      "/srv/AppData/jellyseerr:/app/config"
    ];
    ports = [
      "5055:5055"
    ];
    services.nginx.virtualHosts = {
      "jellyseerr.local" = {

        locations."/".proxyPass = "http://127.0.0.1:5055";
      };
    };

  };
}
