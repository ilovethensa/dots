{pkgs, ...}: {
  services.maddy = {
    enable = true;
    primaryDomain = "mail.pwned.page";
    ensureAccounts = [
      "user1@example.org"
      "postmaster@example.org"
    ];
    ensureCredentials = {
      # Do not use this in production. This will make passwords world-readable
      # in the Nix store
      "user1@example.org".passwordFile = "${pkgs.writeText "postmaster" "test"}";
      "postmaster@example.org".passwordFile = "${pkgs.writeText "postmaster" "test"}";
    };
  };
  services.caddy = {
    enable = true;
    virtualHosts = {
      "mail.pwned.page".extraConfig = ''
        reverse_proxy http://localhost:8080
      '';
    };
  };

  services.cloudflare-dyndns.domains = [
    "mail.pwned.page"
  ];

  security.acme.certs = {
    "mail.pwned.page" = {};
  };
  networking.firewall = {
    allowedTCPPorts = [
      8080
      25
      587
      465
      143
      993
      4190
      110
      995
    ];
    allowedUDPPorts = [
      8080
      25
      587
      465
      143
      993
      4190
      110
      995
    ];
  };
}
