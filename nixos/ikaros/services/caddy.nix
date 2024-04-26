{
  pkgs,
  lib,
  config,
  secrets,
  ...
}: {
  environment.etc."cloudflare-api-token".text = secrets.cloudflare.apitoken;
  services.caddy = {
    enable = true;
    virtualHosts = {
      "mc.theholytachanka.com".extraConfig = ''
        reverse_proxy 192.168.1.111:25565
      '';
      "md.theholytachanka.com".extraConfig = ''
        reverse_proxy 127.0.0.1:6567
      '';
    };
  };
  services.cfdyndns = {
    enable = true;
    apiTokenFile = "/etc/cloudflare-api-token";
    records = [
      "mc.theholytachanka.com"
      "md.theholytachanka.com"
    ];
  };
}
