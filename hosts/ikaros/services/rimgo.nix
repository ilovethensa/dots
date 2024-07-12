{...}: {
  services.rimgo = {
    enable = true;
    settings = {
      ADDRESS = "0.0.0.0";
      PORT = 3495;
      PRIVACY_COUNTRY = "BG";
      PRIVACY_PROVIDER = "ISP";
      PRIVACY_NOT_COLLECTED = "1";
      PRIVACY_IP = "1";
      PRIVACY_URL = "1";
      PRIVACY_DEVICE = "1";
      PRIVACY_DIAGNOSTICS = "1";
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
