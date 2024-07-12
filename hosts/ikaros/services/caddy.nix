{config, ...}: {
  # Secrets
  sops.secrets.cloudflare_key = {};
  sops.templates."ddns_env".content = ''
    CLOUDFLARE_API_TOKEN="${config.sops.placeholder.cloudflare_key}"
  '';

  services.caddy = {
    enable = true;
    virtualHosts = {
      "mc.heholytachanka.com".extraConfig = ''
        reverse_proxy http://localhost:25565
      '';
      "vpn.heholytachanka.com".extraConfig = ''
        reverse_proxy http://localhost:51821
      '';
      "mindustry.heholytachanka.com".extraConfig = ''
        reverse_proxy http://localhost:6567
      '';
      "localhost".extraConfig = ''
        respond "Hello, world!"
      '';
      "192.168.1.111".extraConfig = ''
        respond "Hello, world!"
      '';
      "91.139.255.26".extraConfig = ''
        respond "Hello, world!"
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
    ];
  };
  networking.firewall.allowedTCPPorts = [
    443
    80
  ];
}
