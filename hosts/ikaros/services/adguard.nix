{...}: {
  services.adguardhome = {
    enable = true;
    allowDHCP = true;
    mutableSettings = true;
  };
  environment.persistence."/nix/persist".directories = [
    "/var/lib/AdGuardHome"
    "/var/lib/private/AdGuardHome"
  ];
}
