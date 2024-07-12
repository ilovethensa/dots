{...}: {
  services.rimgo = {
    enable = true;
    settings = {
      ADDRESS = "0.0.0.0";
      PORT = 3495;
      PRIVACY_COUNTRY = "BG";
      PRIVACY_PROVIDER = "ISP";
      PRIVACY_NOT_COLLECTED = false;
      PRIVACY_IP = true;
      PRIVACY_URL = true;
      PRIVACY_DEVICE = true;
      PRIVACY_DIAGNOSTICS = true;
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
