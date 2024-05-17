{
  config,
  lib,
  ...
}: {
  sops.secrets.ip_address = {};
  sops.secrets."wireguard_pass" = {};
  virtualisation.oci-containers.containers."wireguard" = {
    image = "ghcr.io/wg-easy/wg-easy";
    autoStart = true;
    volumes = [
      "/srv/data/wireguard:/etc/wireguard"
    ];
    ports = [
      "51820:51820/udp"
      "51821:51821/tcp"
    ];
    environment = {
      WG_HOST = config.sops.secrets.ip_address;
      PASSWORD = "Just fucking work";
      PORT = 51821;
      WG_PORT = 51820;
    };
    extraOptions = [
      "--cap-add=NET_ADMIN"
      "--cap-add=SYS_MODULE"
      "--sysctl=\"net.ipv4.conf.all.src_valid_mark=1\""
      "--sysctl=\"net.ipv4.ip_forward=1\""
    ];
  };
}
