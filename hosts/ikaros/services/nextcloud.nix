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
    config = {
      dbtype = "pgsql";
      dbuser = "nextcloud";
      dbhost = "/run/postgresql"; # nextcloud will add /.s.PGSQL.5432 by itself
      dbname = "nextcloud";
      adminpassFile = config.sops.secrets.vpn_pass.path;
      adminuser = "root";
    };
  };

  services.postgresql = {
    enable = true;
    dataDir = "/mnt/data/postgres/${config.services.postgresql.package.psqlSchema}";
    ensureDatabases = ["nextcloud"];
    ensureUsers = [
      {
        name = "nextcloud";
        ensureDBOwnership = true;
      }
    ];
  };

  # ensure that postgres is running *before* running the setup
  systemd.services."nextcloud-setup" = {
    requires = ["postgresql.service"];
    after = ["postgresql.service"];
  };

  /*
     services.nginx.virtualHosts."localhost".listen = [
    {
      addr = "127.0.0.1";
      port = 3524;
    }
  ];
  */

  networking.firewall.allowedTCPPorts = [80 443];
}
