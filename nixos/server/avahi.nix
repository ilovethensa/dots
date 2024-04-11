{ inputs, outputs, lib, config, pkgs, ... }: {
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    hostName = "server";
    publish = {
      enable = true;
      addresses = true;
      domain = true;
      hinfo = true;
      userServices = true;
      workstation = true;
    };
    extraServiceFiles = {
      dash = ''
        <?xml version="1.0" standalone='no'?>
        <!DOCTYPE service-group SYSTEM "avahi-service.dtd">
        <service-group>
        <name replace-wildcards="yes">dash</name>
        <service>
        <type>_http._tcp</type>
        <port>8082</port>
        </service>
        </service-group>
      '';
    };
  };

/*   systemd.services.avahi-mdns = {
    enable = true;
    serviceConfig = {
      Type = "simple";
      ExecStart = ''
        ${pkgs.avahi}/bin/avahi-publish -a jellyfin.local -R 192.168.1.111 &
        ${pkgs.avahi}/bin/avahi-publish -a sonarr.local -R 192.168.1.111 &
      '';
      # ...
    };
    After = [ "network.target" "avahi-daemon.service" ];
    PartOf = [ "avahi-daemon.service" ];
    wantedBy = [ "multi-user.target" ];
    # ...
  }; */

}
# #!/bin/bash

# for DOMAIN in jellyfin.local sonarr.local; do avahi-publish -a $DOMAIN -R 192.168.1.111; done
