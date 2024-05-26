{...}: {
  services.changedetection-io = {
    enable = true;
    datastorePath = "/mnt/data/changedetection";
    playwrightSupport = true;
  };
}
