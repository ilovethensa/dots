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
      adminpassFile = config.sops.secrets.vpn_pass.path;
      adminuser = "admin";
    };
    caching = {
      apcu = true;
      memcached = true;
      redis = true;
    };
  };
  services.nginx.virtualHosts."localhost".listen = [
    {
      addr = "127.0.0.1";
      port = 8080;
    }
  ];

  networking.firewall.allowedTCPPorts = [
    8080
  ];
}
