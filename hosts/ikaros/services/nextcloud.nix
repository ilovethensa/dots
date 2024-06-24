{
  config,
  pkgs,
  ...
}: {
  sops.secrets.vpn_pass.mode = "777";
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud29;
    hostName = "cloud.ikaros.lan";
    config.adminpassFile = config.sops.secrets.vpn_pass.path;
    configureRedis = true;
    datadir = "/mnt/data/nextcloud";
    home = "/mnt/Media/nextcloud";
    appstoreEnable = true;
    autoUpdateApps.enable = true;
    database.createLocally = true;
    settings.overwriteprotocol = "http";
    settings.trusted_domains = [
      "cloud.ikaros.lan"
    ];
  };
  networking.firewall.allowedTCPPorts = [
    4433
    80
  ];
}
