{...}: {
  virtualisation.oci-containers.containers."stalwart" = {
    image = "stalwartlabs/mail-server:v0.8.5";
    ports = [
      "8080:8080"
      "25:25"
      "587:587"
      "465:465"
      "143:146"
      "993:993"
      "4190:4190"
      "110:110"
      "995:995"
    ];
    volumes = [
      "/mnt/data/mail:/opt/stalwart-mail"
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
