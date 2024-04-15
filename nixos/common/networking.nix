{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # Networking configurations
  networking = {
    firewall.enable = false;
    dhcpcd.extraConfig = ''
      noarp
      nohook resolv.conf
    '';
    networkmanager.dns = "none";
    nameservers = ["127.0.0.1" "127.0.0.15"];
  };
  services = {
    dnscrypt-proxy2 = {
      enable = true;
      settings = {
        ipv6_servers = true;
        require_dnssec = true;

        sources.public-resolvers = {
          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
            "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
          ];
          cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        };
      };
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
    };
    printing.enable = true;
  };

  # Set the timezone to Bulgaria
  time.timeZone = "Europe/Sofia";

  services = {
    tor = {
      enable = true;
      settings.DNSPort = lib.mkForce 53;
      client = {
        enable = true;
        dns.enable = true;
      };
    };
    stubby = {
      enable = true;
      settings =
        pkgs.stubby.passthru.settingsExample
        // {
          listen_addresses = ["127.0.0.15"];
          upstream_recursive_servers = [
            {
              address_data = "1.1.1.1";
              tls_auth_name = "cloudflare-dns.com";
              tls_pubkey_pinset = [
                {
                  digest = "sha256";
                  value = "GP8Knf7qBae+aIfythytMbYnL+yowaWVeD6MoLHkVRg=";
                }
              ];
            }
            {
              address_data = "1.0.0.1";
              tls_auth_name = "cloudflare-dns.com";
              tls_pubkey_pinset = [
                {
                  digest = "sha256";
                  value = "GP8Knf7qBae+aIfythytMbYnL+yowaWVeD6MoLHkVRg=";
                }
              ];
            }
          ];
        };
    };
  };
}
