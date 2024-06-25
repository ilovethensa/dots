{...}: {
  virtualisation.oci-containers.containers = {
    changedetection-io-playwright = {
      image = "browserless/chrome";
      environment = {
        SCREEN_WIDTH = "1920";
        SCREEN_HEIGHT = "1024";
        SCREEN_DEPTH = "16";
        ENABLE_DEBUGGER = "false";
        PREBOOT_CHROME = "true";
        CONNECTION_TIMEOUT = "300000";
        MAX_CONCURRENT_SESSIONS = "10";
        CHROME_REFRESH_TIME = "600000";
        DEFAULT_BLOCK_ADS = "true";
        DEFAULT_STEALTH = "true";
      };
      ports = [
        "3000:3000"
      ];
      extraOptions = ["--network=bridge"];
    };
    changedetection-io = {
      image = "ghcr.io/dgtlmoon/changedetection.io:0.45.24";
      environment = {
        PLAYWRIGHT_DRIVER_URL = "ws://localhost:3000";
      };
      ports = [
        "5000:5000"
      ];
      extraOptions = ["--network=bridge"];
      volumes = [
        "/mnt/data/changedetection:/datastore"
      ];
      dependsOn = [
        "changedetection-io-playwright"
      ];
    };
  };

  networking.firewall.allowedTCPPorts = [
    5000
    3000
  ];
}
