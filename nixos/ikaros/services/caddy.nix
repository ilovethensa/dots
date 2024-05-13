{
  pkgs,
  lib,
  config,
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
    apiTokenFile =  ${config.sops.secrets."cloudflare_key".path};
    records = [
      "mc.theholytachanka.com"
    ];
  };
}
