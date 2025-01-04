{...}: {
  virtualisation.oci-containers.containers."glances" = {
    image = "nicolargo/glances:ubuntu-4.3.0.7-full";
    autoStart = true;
    ports = [
      "61208-61209:61208-61209"
    ];
    volumes = [
      "/run/user/1000/podman/podman.sock:/run/user/1000/podman/podman.sock:ro"
      #"/var/run/docker.sock:/var/run/docker.sock:ro"
      "/mnt:/mnt:ro"
    ];
    environment = {
      GLANCES_OPT = "-w";
    };
    extraOptions = [
      "--pid=host"
    ];
  };
  networking.firewall.allowedTCPPorts = [
    61208
    61209
  ];
}
