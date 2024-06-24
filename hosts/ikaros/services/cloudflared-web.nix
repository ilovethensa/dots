{...}: {
  virtualisation.oci-containers.containers."cloudflared-web" = {
    image = "ghcr.io/wisdomsky/cloudflared-web:2024.6.1";
    autoStart = true;
    volumes = [
      "/mnt/data/cloudflared-web:/config"
    ];
    extraOptions = ["--network=host"];
  };
}
