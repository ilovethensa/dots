{
  config,
  pkgs,
  ...
}: {
  sops.secrets.vpn_pass.mode = "777";
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud29;
    hostName = "192.168.1.111";
    config.adminpassFile = config.sops.secrets.vpn_pass.path;
    configureRedis = true;
    datadir = "/mnt/data/nextcloud";
    home = "/mnt/media/nextcloud";
    appstoreEnable = true;
    autoUpdateApps.enable = true;
    database.createLocally = true;
    settings.overwriteprotocol = "http";
    settings.trusted_domains = [
      "192.168.1.111"
    ];
    config.overwriteProtocol = "http";
    https = false;
  };
  services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
    forceSSL = false;
    enableACME = false;
  };
  networking.firewall.allowedTCPPorts = [
    443
    80
  ];
}
