{config, ...}: {
  sops.secrets.vpn_pass = {};
  sops.templates."wireguard_env".content = ''
    export PASSWORD="${config.sops.placeholder.vpn_pass}"
  '';
  virtualisation.oci-containers.containers."wireguard" = {
    image = "ghcr.io/wg-easy/wg-easy";
    autoStart = true;
    ports = [
      "51820:51820/udp"
      "51821:51821/tcp"
    ];
    volumes = [
      "/mnt/data/wireguard:/etc/wireguard"
    ];
    environment = {
      LANG = "en";
      WG_HOST = "91.139.255.26";
      PORT = "51821";
      WG_PORT = "51820";
    };
    environmentFiles = [
      config.sops.templates."wireguard_env".path
    ];
    extraOptions = [
      "--cap-add=NET_ADMIN"
      "--cap-add=SYS_MODULE"
      "--cap-add=NET_RAW"
      "--sysctl=\"net.ipv4.conf.all.src_valid_mark=1\""
      "--sysctl=\"net.ipv4.ip_forward=1\""
    ];
  };
  networking.firewall = {
    allowedTCPPorts = [
      51821
    ];
    allowedUDPPorts = [
      51820
    ];
  };
}
