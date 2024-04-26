{
  pkgs,
  lib,
  config,
  secrets,
  ...
}: {
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
    apikeyFile = pkgs.writeText secrets.cloudflare.apikey;
    records = [
      "mc.theholytachanka.com"
    ];
  };
}
