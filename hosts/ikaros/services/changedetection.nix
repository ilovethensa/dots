{...}: {
  virtualisation.oci-containers.containers = {
    "changedetection" = {
      image = "dgtlmoon/changedetection.io";
      autoStart = true;
      environment = {
        PLAYWRIGHT_DRIVER_URL = "ws://192.168.1.111:3000";
      };
      volumes = [
        "/mnt/data/changedetection:/datastore"
      ];
      ports = [
        "5000:5000"
      ];
    };
    "playwright-chrome" = {
      image = "dgtlmoon/sockpuppetbrowser:latest";
    };
    extraOptions = [
      "--cap-add=SYS_ADMIN"
    ];
    environment = {
      SCREEN_WIDTH = 1920;
      SCREEN_HEIGHT = 1024;
      SCREEN_DEPTH = 16;
      MAX_CONCURRENT_CHROME_PROCESSES = 10;
    };
  };
}
