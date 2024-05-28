{...}: {
  services.changedetection-io = {
    enable = true;
    datastorePath = "/mnt/data/changedetection";
    port = 5603;
    playwrightSupport = true;
    listenAddress = "0.0.0.0";
  };
}
