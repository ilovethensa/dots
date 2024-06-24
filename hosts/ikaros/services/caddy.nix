{config, ...}: {
  # Secrets
  sops.secrets.cloudflare_key = {};
  sops.templates."acme_env".content = ''
    CLOUDFLARE_DNS_API_TOKEN="${config.sops.placeholder.cloudflare_key}"
  '';

  # Nginx service configuration
  services.nginx = {
    enable = true;
    virtualHosts = {
      "mc.theholytachanka.com" = {
        locations = {
          "/" = {
            proxyPass = "http://192.168.1.111:25565";
          };
        };
      };
      "vpn.theholytachanka.com" = {
        locations = {
          "/" = {
            proxyPass = "http://192.168.1.111:51821";
          };
        };
      };
      "mindustry.theholytachanka.com" = {
        locations = {
          "/" = {
            proxyPass = "http://192.168.1.111:6567";
          };
        };
      };
      "cloud.local" = {
        locations = {
          "/" = {
            proxyPass = "http://192.168.1.111:80";
          };
        };
        enableACME = false;
        forceSSL = false;
      };
    };
  };

  # Cloudflare Dynamic DNS Update Service
  services.cfdyndns = {
    enable = true;
    apiTokenFile = config.sops.secrets.cloudflare_key.path;
    records = [
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
