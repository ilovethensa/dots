{
  pkgs,
  lib,
  config,
  ...
}: {
  virtualisation.oci-containers.containers."cloudflared-web" = {
    image = "ghcr.io/wisdomsky/cloudflared-web:latest";
    autoStart = true;
    volumes = [
      "/srv/data/cloudflared-web:/config"
    ];
    extraOptions = ["--network=host"];
  };
  services.nginx.virtualHosts = {
    "clourflared.local" = {
      locations."/".proxyPass = "http://127.0.0.1:14333";
    };
  };
}
