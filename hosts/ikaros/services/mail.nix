{...}: {
  virtualisation.oci-containers.containers."docker-mailserver" = {
    image = "ghcr.io/docker-mailserver/docker-mailserver:latest";
    ports = [
      "25:25"
      "465:465"
      "587:587"
      "993:993"
    ];
    volumes = [
      "/mnt/data/mail/mail-data/:/var/mail/"
      "/mnt/data/mail/mail-state/:/var/mail-state/"
      "/mnt/data/mail/mail-logs/:/var/log/mail/"
      "/mnt/data/mail/config/:/tmp/docker-mailserver/"
      "/etc/localtime:/etc/localtime:ro"
    ];
    environment = {
      ENABLE_RSPAMD = "0";
      ENABLE_CLAMAV = "0";
      ENABLE_FAIL2BAN = "0";
    };
    extraOptions = [
      "--hostname mail.pwned.page"
      "--cap-add NET_ADMIN"
    ];
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
