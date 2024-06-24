{
  config,
  pkgs,
  ...
}: {
  sops.secrets.vpn_pass.mode = "777";
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud29;
    config.adminpassFile = config.sops.secrets.vpn_pass.path;
    configureRedis = true;
    datadir = "/mnt/data/nextcloud";
    home = "/mnt/media/nextcloud";
    appstoreEnable = true;
    autoUpdateApps.enable = true;
    database.createLocally = true;
    https = false;
  };
  networking.firewall.allowedTCPPorts = [
    443
    80
  ];
}
