{...}: {
  services.libreddit = {
    enable = true;
    port = 5462;
  };
  services.caddy = {
    enable = true;
    virtualHosts = {
      "lr.pwned.page".extraConfig = ''
        reverse_proxy http://localhost:5462
      '';
    };
  };

  services.cloudflare-dyndns.domains = [
    "lr.pwned.page"
  ];

  security.acme.certs = {
    "lr.pwned.page" = {};
  };
}
