{...}: {
  virtualisation.oci-containers.containers."jellyseerr" = {
    image = "fallenbagel/jellyseerr:2.6.0";
    autoStart = true;
    volumes = [
      "/mnt/data/jellyseerr:/app/config"
    ];
    ports = [
      "5055:5055"
    ];
  };
  networking.firewall.allowedTCPPorts = [
    5055
  ];
}
