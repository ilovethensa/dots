{
  pkgs,
  lib,
  config,
  secrets,
  ...
}: {
  environment.etc."cloudflare-api-key".text = secrets.cloudflare.apikey;
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
    email = secrets.cloudflare.email;
    apikeyFile = "/etc/cloudflare-api-key";
    records = [
      "mc.theholytachanka.com"
    ];
  };
}
