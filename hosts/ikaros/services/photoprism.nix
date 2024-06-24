{config, ...}: {
  services.photoprism = {
    enable = true;
    address = "192.168.1.111";
    originalsPath = "/mnt/media/photos";
    storagePath = "/mnt/data/prism";
    passwordFile = config.sops.secrets.vpn_pass.path;
  };
}
