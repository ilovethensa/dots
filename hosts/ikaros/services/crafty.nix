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
      "/srv/data/crafty/backups:/crafty/backups"
      "/srv/data/crafty/logs:/crafty/logs"
      "/srv/data/crafty/servers:/crafty/servers"
      "/srv/data/crafty/config:/crafty/app/config"
      "/srv/data/crafty/import:/crafty/import"
    ];
  };
}
