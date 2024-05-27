{...}: {
  virtualisation.oci-containers.containers."kasm" = {
    image = "lscr.io/linuxserver/kasm:latest";
    autoStart = true;
    volumes = [
      "/mnt/data/kasm/data:/opt"
      "/mnt/data/kasm/profiles:/profiles"
      "/dev/input:/dev/input"
      "/run/udev/data:/run/udev/data"
    ];
    environment = {
      KASM_PORT = "443";
    };
    ports = [
      "3000:3000"
      "443:443"
    ];
    extraOptions = ["--privileged"];
  };
  networking.firewall = {
    allowedTCPPorts = [
      443
    ];
    allowedUDPPorts = [
      443
    ];
  };
}
