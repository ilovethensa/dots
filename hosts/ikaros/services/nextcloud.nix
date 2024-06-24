{
  config,
  pkgs,
  ...
}: {
  sops.secrets.vpn_pass.mode = "777";
  services.nextcloud = {
    enable = true;
    hostName = "cloud.local";
    appstoreEnable = true;
    package = pkgs.nextcloud29;
    configureRedis = true;
    datadir = "/mnt/data/nextcloud";
    home = "/mnt/media/nextcloud";
    database.createLocally = true;
    config = {
      dbtype = "pgsql";
      dbuser = "nextcloud";
      dbpassFile = config.sops.secrets.vpn_pass.path;
      adminpassFile = config.sops.secrets.vpn_pass.path;
      adminuser = "admin";
    };
  };

  /*
     services.nginx.virtualHosts."localhost".listen = [
    {
      addr = "127.0.0.1";
      port = 3524;
    }
  ];
  */

  networking.firewall.allowedTCPPorts = [
    80 # http
    443 # https
  ];
}
