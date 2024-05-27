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
      KASM_PORT = "3647";
    };
    ports = [
      "3000:3000"
      "3647:3647"
    ];
    extraOptions = ["--privileged"];
  };
  networking.firewall = {
    allowedTCPPorts = [
      3647
    ];
    allowedUDPPorts = [
      3647
    ];
  };
}
