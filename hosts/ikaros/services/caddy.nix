{config, ...}: {
  # Secrets
  sops.secrets.cloudflare_key = {};
  sops.templates."ddns_env".content = ''
    CLOUDFLARE_API_TOKEN="${config.sops.placeholder.cloudflare_key}"
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
      "request.theholytachanka.com" = {
        locations = {
          "/" = {
            proxyPass = "http://192.168.1.111:5055";
          };
        };
      };
    };
  };

  services.cloudflare-dyndns = {
    enable = true;
    apiTokenFile = config.sops.templates."ddns_env".path;
    domains = [
      "mc.theholytachanka.com"
      "vpn.theholytachanka.com"
      "mindustry.theholytachanka.com"
      "request.theholytachanka.com"
    ];
  };
  networking.firewall.allowedTCPPorts = [
    443
    80
  ];
}
