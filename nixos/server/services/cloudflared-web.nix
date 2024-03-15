{ pkgs, lib, config, ... }:
{
  virtualisation.oci-containers.containers."cloudflared-web" = {
    image = "wisdomsky/cloudflared-web:latest";
    autoStart = true;
    volumes = [
      "/srv/AppData/cloudflared-web:/config"
    ];
    ports = [
      "5055:5055"
    ];

  };
}
