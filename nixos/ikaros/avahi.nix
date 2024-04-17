{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  services.avahi = {
    enable = true;
    #nssmdns4 = true;
    hostName = "server";
    publish = {
      enable = true;
      addresses = true;
      domain = true;
      hinfo = true;
      userServices = true;
      workstation = true;
    };
  };

  # &
  #${pkgs.avahi}/bin/avahi-publish -a dash.local -R 192.168.1.111 &
  #${pkgs.avahi}/bin/avahi-publish -a transmission.local -R 192.168.1.111 &
  #${pkgs.avahi}/bin/avahi-publish -a sonarr.local -R 192.168.1.111 &
  #${pkgs.avahi}/bin/avahi-publish -a radarr.local -R 192.168.1.111 &
  #${pkgs.avahi}/bin/avahi-publish -a bazarr.local -R 192.168.1.111 &
  #${pkgs.avahi}/bin/avahi-publish -a prowlarr.local -R 192.168.1.111
}
