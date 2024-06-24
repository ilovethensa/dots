{config, ...}: {
  sops.secrets.cloudflare_key = {};
  services.caddy = {
    enable = true;
    virtualHosts = {
      "mc.theholytachanka.com".extraConfig = ''
        reverse_proxy 192.168.1.111:25565
      '';
      "vpn.theholytachanka.com".extraConfig = ''
        reverse_proxy 192.168.1.111:51821
      '';
      "mindustry.theholytachanka.com".extraConfig = ''
        reverse_proxy 192.168.1.111:6567
      '';
      "cloud.ikaros.lan".extraConfig = ''
        reverse_proxy 192.168.1.111
      '';
    };
  };
  services.cfdyndns = {
    enable = true;
    apiTokenFile = config.sops.secrets."cloudflare_key".path;
    records = [
      "mc.theholytachanka.com"
      "vpn.theholytachanka.com"
      "mindustry.theholytachanka.com"
    ];
  };
}
