{
  config,
  pkgs,
  ...
}: {
  sops.secrets.vpn_pass.mode = "777";
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud29;
    hostName = "cloud.local";
    config.adminpassFile = config.sops.secrets.vpn_pass.path;
    configureRedis = true;
    datadir = "/mnt/data/nextcloud";
    home = "/mnt/media/nextcloud";
    appstoreEnable = true;
    autoUpdateApps.enable = true;
    database.createLocally = true;
    settings.overwriteprotocol = "https";
    settings.trusted_domains = [
      "cloud.local"
    ];
    config.overwriteProtocol = "https";
    nginx.enable = true;
  };
  networking.firewall.allowedTCPPorts = [
    433
    80
  ];
}
