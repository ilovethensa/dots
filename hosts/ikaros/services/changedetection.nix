{...}: {
  services.changedetection-io = {
    enable = true;
    # webDriverSupport = true;
    playwrightSupport = true;
    datastorePath = "/mnt/data/changedetection";
    port = 4361;
  };
}
