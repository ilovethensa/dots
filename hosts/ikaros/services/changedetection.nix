{...}: {
  services.changedetection-io = {
    enable = true;
    datastorePath = "/mnt/data/changedetection";
    port = 3000;
    playwrightSupport = true;
    listenAddress = "0.0.0.0";
  };
}
