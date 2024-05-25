{...}: {
  virtualisation.oci-containers.containers."crafty" = {
    image = "registry.gitlab.com/crafty-controller/crafty-4:latest";
    autoStart = true;
    ports = [
      "8443:8443"
      "8123:8123"
      "19132:19132/udp"
      "25500-25600:25500-25600"
    ];
    volumes = [
      "/mnt/data/crafty/backups:/crafty/backups"
      "/mnt/data/crafty/logs:/crafty/logs"
      "/mnt/data/crafty/servers:/crafty/servers"
      "/mnt/data/crafty/config:/crafty/app/config"
      "/mnt/data/crafty/import:/crafty/import"
    ];
  };
  networking.firewall.allowedTCPPorts = [
    "25565" # Minecraft
  ];
}
