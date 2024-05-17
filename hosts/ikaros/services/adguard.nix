{...}: {
  services.adguardhome = {
    enable = true;
    allowDHCP = true;
    mutableSettings = true;
  };
}
