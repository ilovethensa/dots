{ pkgs
, lib
, config
, secrets
, ...
}: {
  nixarr = {
    enable = true;
    mediaDir = "/srv/Media";
    stateDir = "/srv/data";

    jellyfin.enable = true;
    transmission = {
      enable = true;
      peerPort = 50000;
    };
    bazarr.enable = true;
    prowlarr.enable = true;
    radarr.enable = true;
    sonarr.enable = true;
  };

  services.caddy.virtualHosts = {
    "flixnet.local".extraConfig = ''
      reverse_proxy :8096
      tls internal
    '';
    "transmission.local".extraConfig = ''
      reverse_proxy :9091
      tls internal
    '';
    "radarr.local".extraConfig = ''
      reverse_proxy :7878
      tls internal
    '';
    "sonarr.local".extraConfig = ''
      reverse_proxy :8989
      tls internal
    '';
    "bazarr.local".extraConfig = ''
      reverse_proxy :6767
      tls internal
    '';
    "prowlarr.local".extraConfig = ''
      reverse_proxy :9696
      tls internal
    '';
    "dash.local".extraConfig = ''
      reverse_proxy :8092
      tls internal
    '';
  };

  systemd.services = {
    "avahi-jellyfin" = {
      enable = true;
      script = "${pkgs.avahi}/bin/avahi-publish -a flixnet.local -R 192.168.1.111";
      serviceConfig.Type = "simple";
      wantedBy = [ "default.target" ];
    };
    "avahi-transmission" = {
      enable = true;
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.avahi}/bin/avahi-publish -a transmission.local -R 192.168.1.111";
      };
      wantedBy = [ "default.target" ];
    };
    "avahi-radarr" = {
      enable = true;
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.avahi}/bin/avahi-publish -a radarr.local -R 192.168.1.111";
      };
      wantedBy = [ "default.target" ];
    };
    "avahi-sonarr" = {
      enable = true;
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.avahi}/bin/avahi-publish -a sonarr.local -R 192.168.1.111";
      };
      wantedBy = [ "default.target" ];
    };
    "avahi-bazarr" = {
      enable = true;
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.avahi}/bin/avahi-publish -a bazarr.local -R 192.168.1.111";
      };
      wantedBy = [ "default.target" ];
    };
    "avahi-prowlarr" = {
      enable = true;
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.avahi}/bin/avahi-publish -a prowlarr.local -R 192.168.1.111";
      };
      wantedBy = [ "default.target" ];
    };
    "avahi-dash" = {
      enable = true;
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.avahi}/bin/avahi-publish -a dash.local -R 192.168.1.111";
      };
      wantedBy = [ "default.target" ];
    };
  };

}
