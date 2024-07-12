{...}: {
  services.rimgo = {
    enable = true;
    settings = {
      ADDRESS = "0.0.0.0";
      PORT = 3495;
    };
  };
  services.caddy = {
    enable = true;
    virtualHosts = {
      "rimgo.theholytachanka.com".extraConfig = ''
        reverse_proxy http://localhost:3495
      '';
    };
  };

  services.cloudflare-dyndns.domains = [
    "rimgo.theholytachanka.com"
  ];

  security.acme.certs = {
    "rimgo.theholytachanka.com" = {};
  };
}
