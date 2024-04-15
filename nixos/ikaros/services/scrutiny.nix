{ pkgs, lib, config, ... }:
{
  virtualisation.oci-containers.containers."scrutiny" = {
    image = "ghcr.io/analogj/scrutiny:master-omnibus";
    autoStart = true;
    volumes = [
      "/srv/AppData/scrutiny/config:/opt/scrutiny/config"
      "/srv/AppData/scrutiny/database:/opt/scrutiny/influxdb"
      "/run/udev:/run/udev:ro"
    ];
    ports = [
      "8090:8080"
      "8086:8086"
    ];

    extraOptions = [ "--cap-add" "SYS_RAWIO" "--device=/dev/sda" "--device=/dev/sdb" "--device=/dev/sdc" ];
  };
  services.nginx.virtualHosts = {
    "scrutiny.local" = {

      locations."/".proxyPass = "http://127.0.0.1:8090";
    };
  };

}
