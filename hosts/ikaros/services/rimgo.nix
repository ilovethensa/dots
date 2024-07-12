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
      "rimgo.pwned.page".extraConfig = ''
        reverse_proxy http://localhost:3495
      '';
    };
  };

  services.cloudflare-dyndns.domains = [
    "rimgo.pwned.page"
  ];

  security.acme.certs = {
    "rimgo.pwned.page" = {};
  };
}
