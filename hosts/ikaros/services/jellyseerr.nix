{...}: {
  virtualisation.oci-containers.containers."jellyseerr" = {
    image = "fallenbagel/jellyseerr:latest";
    autoStart = true;
    volumes = [
      "/srv/data/jellyseerr:/app/config"
    ];
    ports = [
      "5055:5055"
    ];
  };
}
