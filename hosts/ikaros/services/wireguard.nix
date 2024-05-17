{...}: {
  virtualisation.oci-containers.containers."wireguard" = {
    image = "ghcr.io/wg-easy/wg-easy";
    autoStart = true;
    ports = [
      "51820:51820/udp"
      "51821:51821/tcp"
    ];
    volumes = [
      "/srv/data/wireguard:/etc/wireguard"
    ];
    environment = {
      LANG = "en";
      WG_HOST = "91.139.255.26";
      PASSWORD = "test123";
      PORT = "51821";
      WG_PORT = "51820";
    };
    extraOptions = [
      "--cap-add=NET_ADMIN"
      "--cap-add=SYS_MODULE"
      "--cap-add=NET_RAW"
      "--sysctl=\"net.ipv4.conf.all.src_valid_mark=1\""
      "--sysctl=\"net.ipv4.ip_forward=1\""
    ];
  };
}
