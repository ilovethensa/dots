{...}: {
  ## Tor onion
  services.tor = {
    enable = true;
    enableGeoIP = false;
    relay.onionServices = {
      "theholytachanka.com" = {
        version = 3;
        map = [
          {
            port = 80;
            target = {
              addr = "[::1]";
              port = 80;
            };
          }
        ];
      };
    };
    settings = {
      ClientUseIPv4 = false;
      ClientUseIPv6 = true;
      ClientPreferIPv6ORPort = true;
    };
  };
  services.snowflake-proxy = {
    enable = true;
    capacity = 100;
  };
  environment.persistence."/nix/persist".directories = [
    "/var/lib/tor"
  ];
}
