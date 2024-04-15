{ pkgs, lib, config, ... }:
{
  virtualisation.oci-containers.containers."jellyseerr" = {
    image = "fallenbagel/jellyseerr:latest";
    autoStart = true;
    volumes = [
      "/srv/data/jellyseerr:/app/config"
    ];
    ports = [
      "5055:5055"
    ];
  };
  systemd.services = {
    "avahi-jellyseerr" = {
      enable = true;
      script = "${pkgs.avahi}/bin/avahi-publish -a request.local -R 192.168.1.111";
      serviceConfig.Type = "simple";
      wantedBy = [ "default.target" ];
    };
  };
  services.caddy.virtualHosts = {
    "request.local".extraConfig = ''
      reverse_proxy :5055
      tls internal
    '';
  };

}
