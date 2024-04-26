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
    };
  };
  services.cfdyndns = {
    enable = true;
    apiTokenFile = "/etc/cloudflare-api-token";
    records = [
      "mc.theholytachanka.com"
    ];
  };
}
