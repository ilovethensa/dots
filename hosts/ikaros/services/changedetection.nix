{...}: {
  services.changedetection-io = {
    enable = true;
    # webDriverSupport = true;
    playwrightSupport = true;
    datastorePath = "/mnt/data/changedetection";
    port = 4361;
    listenAddress = "192.168.1.111";
  };
}
