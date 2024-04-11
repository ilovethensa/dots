{ pkgs, lib, config, ... }:
{
  environment.etc."nextcloud-admin-pass".text = "RatioPrudnq123";
  services = {
    nextcloud = {
      enable = true;
      hostName = "cloud.theholytachanka.com";

      # Need to manually increment with every major upgrade.
      package = pkgs.nextcloud28;

      # Let NixOS install and configure the database automatically.
      database.createLocally = true;

      # Let NixOS install and configure Redis caching automatically.
      configureRedis = true;

      # Increase the maximum file upload size to avoid problems uploading videos.
      maxUploadSize = "16G";
      https = false;

      autoUpdateApps.enable = true;
      extraAppsEnable = true;
      extraApps = with config.services.nextcloud.package.packages.apps; {
        # List of apps we want to install and are already packaged in
        # https://github.com/NixOS/nixpkgs/blob/master/pkgs/servers/nextcloud/packages/nextcloud-apps.json
        inherit calendar contacts mail notes tasks;
      };

      config = {

        dbtype = "pgsql";
        adminuser = "admin";
        adminpassFile = "/etc/nextcloud-admin-pass";
      };
      settings = {
        default_phone_region = "PT";
      };
    };
  };
  environment.persistence."/srv/Media/persist".directories = [
    "/var/lib/redis-nextcloud"
    "/var/lib/postgresql"
    "/var/lib/nextcloud"
  ];
  services.nginx.virtualHosts = {
    "cloud.local" = {
      default = true;
      locations."/".proxyPass = "http://127.0.0.1:14333";
    };
  };


}
