{config, ...}: {
  sops.secrets.cloudflare_key = {};
  sops.templates."acme_env".content = ''
    CLOUDFLARE_DNS_API_TOKEN="${config.sops.placeholder.cloudflare_key}"
  '';
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
      "cloud.local".extraConfig = ''
        reverse_proxy 192.168.1.111:80
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
  security.acme = {
    acceptTerms = true;
    defaults = {
      email = "me@theholytachanka.com";
      dnsProvider = "cloudflare";
      environmentFile = config.sops.templates.acme_env.path;
    };
    certs = {
      ${config.services.nextcloud.hostName}.email = "me@theholytachanka.com";
    };
  };
}
