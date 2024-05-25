{...}: {
  virtualisation.oci-containers.containers."cloudflared-web" = {
    image = "ghcr.io/wisdomsky/cloudflared-web:latest";
    autoStart = true;
    volumes = [
      "/mnt/data/cloudflared-web:/config"
    ];
    extraOptions = ["--network=host"];
  };
}
