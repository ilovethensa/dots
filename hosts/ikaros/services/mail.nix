{config, ...}: {
  sops.secrets.email_pass = {};
  mailserver = {
    enable = true;
    fqdn = "mail.pwned.page";
    domains = ["pwned.page"];

    # A list of all login accounts. To create the password hashes, use
    # nix-shell -p mkpasswd --run 'mkpasswd -sm bcrypt'
    loginAccounts = {
      "tht@pwned.page" = {
        hashedPasswordFile = config.sops.secrets.email_pass.path;
        aliases = ["postmaster@pwned.page"];
      };
    };

    # Use Let's Encrypt certificates. Note that this needs to set up a stripped
    # down nginx and opens port 80.
    certificateScheme = "acme";
  };
  security.acme.acceptTerms = true;
  security.acme.defaults.email = "security@example.com";
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
