{config, ...}: {
  # Secrets
  sops.secrets.cloudflare_key = {};
  sops.templates."ddns_env".content = ''
    CLOUDFLARE_API_TOKEN="${config.sops.placeholder.cloudflare_key}"
  '';
  sops.templates."acme_env".content = ''
    CLOUDFLARE_DNS_API_TOKEN="${config.sops.placeholder.cloudflare_key}"
  '';

  services.caddy = {
    enable = true;
    virtualHosts = {
      "mc.theholytachanka.com".extraConfig = ''
        reverse_proxy http://localhost:25565
      '';
      "vpn.theholytachanka.com".extraConfig = ''
        reverse_proxy http://localhost:51821
      '';
      "mindustry.theholytachanka.com".extraConfig = ''
        reverse_proxy http://localhost:6567
      '';
      "request.theholytachanka.com".extraConfig = ''
        reverse_proxy http://localhost:5055
      '';
      "watch.theholytachanka.com".extraConfig = ''
        reverse_proxy http://localhost:8096
      '';
      "test.theholytachanka.com".extraConfig = ''
        respond "Hello, world!"
      '';
      "theholytachanka.com".extraConfig = ''
        encode gzip
        file_server
        root * /var/www/theholytachanka.com
      '';
      "pwned.page".extraConfig = ''
        encode gzip
        file_server
        root * /var/www/pwned.page
      '';
    };
  };

  services.cloudflare-dyndns = {
    enable = true;
    apiTokenFile = config.sops.templates."ddns_env".path;
    domains = [
      "mc.theholytachanka.com"
      "vpn.theholytachanka.com"
      "mindustry.theholytachanka.com"
      "test.theholytachanka.com"
      "theholytachanka.com"
      "pwned.page"
      "watch.theholytachanka.com"
      "request.theholytachanka.com"
    ];
  };
  security.acme = {
    acceptTerms = true;
    defaults.email = "ame@theholytachanka.com";
    defaults.dnsProvider = "cloudflare";
    defaults.environmentFile = config.sops.templates."acme_env".path;
    certs = {
      "mc.theholytachanka.com" = {};
      "vpn.theholytachanka.com" = {};
      "mindustry.theholytachanka.com" = {};
      "test.theholytachanka.com" = {};
      "theholytachanka.com" = {};
      "pwned.page" = {};
      "watch.theholytachanka.com" = {};
      "request.theholytachanka.com" = {};
    };
  };
  networking.firewall.allowedTCPPorts = [
    443
    80
  ];
  environment.persistence."/nix/persist".directories = [
    "/var/www"
  ];
}
