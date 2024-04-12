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
  /*   services.caddy.virtualHosts = {
    "jellyfin.local".extraConfig = ''
      reverse_proxy :8096
    '';
    "transmission.local".extraConfig = ''
      reverse_proxy :9091
    '';
    "radarr.local".extraConfig = ''
      reverse_proxy :7878
    '';
    "sonarr.local".extraConfig = ''
      reverse_proxy :8989
    '';

    "bazarr.local".extraConfig = ''
      reverse_proxy :6767
    '';

    "prowlarr.local".extraConfig = ''
      reverse_proxy :9696
    '';

    "jellyseerr.local".extraConfig = ''
      reverse_proxy :5055
    '';
  }; */
}
