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
      KASM_PORT = "532";
    };
    ports = [
      "3000:3000"
      "532:532"
    ];
    extraOptions = ["--privileged"];
  };
}
