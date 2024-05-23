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
      "/srv/nvme/crafty/backups:/crafty/backups"
      "/srv/nvme/crafty/logs:/crafty/logs"
      "/srv/nvme/crafty/servers:/crafty/servers"
      "/srv/nvme/crafty/config:/crafty/app/config"
      "/srv/nvme/crafty/import:/crafty/import"
    ];
  };
}
