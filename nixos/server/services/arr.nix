{ pkgs, lib, config, ... }:
{
  nixarr = {
    enable = true;
    # These two values are also the default, but you can set them to whatever
    # else you want
    # WARNING: Do _not_ set them to `/home/user/whatever`, it will not work!
    mediaDir = "/srv/Media";
    stateDir = "/srv/data";

    jellyfin.enable = true;

    transmission = {
      enable = true;
      peerPort = 50000; # Set this to the port forwarded by your VPN
    };
    # It is possible for this module to run the *Arrs through a VPN, but it
    # is generally not recommended, as it can cause rate-limiting issues.
    bazarr.enable = true;
    prowlarr.enable = true;
    radarr.enable = true;
    sonarr.enable = true;
  };
  services.nginx.virtualHosts = {
    "jellyfin.local" = {

      locations."/".proxyPass = "http://127.0.0.1:8096";
    };
    "transmission.local" = {

      locations."/".proxyPass = "http://127.0.0.1:9091";
    };
    "radarr.local" = {

      locations."/".proxyPass = "http://127.0.0.1:7878";
    };
    "sonarr.local" = {

      locations."/".proxyPass = "http://127.0.0.1:8989";
    };
    "bazarr.local" = {

      locations."/".proxyPass = "http://127.0.0.1:6767";
    };
    "prowlarr.local" = {

      locations."/".proxyPass = "http://127.0.0.1:9696";
    };
    "jellyseerr.local" = {

      locations."/".proxyPass = "http://127.0.0.1:5055";
    };
  };
}
