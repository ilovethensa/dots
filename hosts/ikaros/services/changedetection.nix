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
    "browserless-chrome" = {
      image = "ghcr.io/browserless/chromium:latest";
      ports = [
        "3000:3000"
      ];
    };
  };
}
