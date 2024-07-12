{...}: {
  virtualisation.oci-containers.containers."unmanic" = {
    image = "josh5/unmanic";
    ports = [
      "8888:8888"
    ];
    volumes = [
      "/mnt/data/unmanic/config:/config"
      "/mnt/media/library:/library"
      "/mnt/data/unmanic/cache:/tmp/unmanic"
    ];
    extraOptions = [
      "--device=/dev/dri"
    ];
  };
    networking.firewall.allowedTCPPorts = [
    8888
  ];
}
