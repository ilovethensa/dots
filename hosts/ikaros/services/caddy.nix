{config, ...}: {
  # Secrets
  sops.secrets.cloudflare_key = {};

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

  # Cloudflare Dynamic DNS Update Service
  services.cfdyndns = {
    enable = true;
    apiTokenFile = config.sops.secrets.cloudflare_key.path;
    records = [
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
