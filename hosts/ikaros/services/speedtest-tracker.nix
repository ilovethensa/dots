{...}: {
  virtualisation.oci-containers.containers."speedtest-tracker" = {
    image = "lscr.io/linuxserver/speedtest-tracker:latest";
    autoStart = true;
    ports = [
      "2563:80"
    ];
    environment = {
      DB_CONNECTION = "sqlite";
    };
    volumes = [
      "/mnt/data/speedtest-tracker:/config"
    ];
  };
}
