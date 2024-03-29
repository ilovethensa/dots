{ pkgs, lib, config, ... }:
{
  virtualisation.oci-containers.containers."cloudflared-web" = {
    image = "ghcr.io/wisdomsky/cloudflared-web:latest";
    autoStart = true;
    volumes = [
      "/srv/AppData/cloudflared-web:/config"
    ];
    extraOptions = [ "--network=host" ];
  };
}
