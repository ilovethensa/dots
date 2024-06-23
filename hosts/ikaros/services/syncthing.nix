{...}: {
  services.syncthing = {
    enable = true;
    guiAddress = "0.0.0.0:8384";
    dataDir = "/mnt/media/sync";
    configDir = "/mnt/data/syncthing";
    openDefaultPorts = true;
  };
  networking.firewall.allowedTCPPorts = [
    8384
  ];
}
