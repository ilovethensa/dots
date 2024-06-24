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
    home = "/mnt/Media/nextcloud";
    appstoreEnable = true;
    autoUpdateApps.enable = true;
    database.createLocally = true;
    settings.overwriteprotocol = "http";
  };
  networking.firewall.allowedTCPPorts = [
    4433
    80
  ];
}
