{ pkgs, lib, config, ... }:
{
  virtualisation.oci-containers.containers."glances" = {
    image = "joweisberg/glances:latest";
    ports = [ "61208:61208" ];
    volumes = [
      #"/var/run/docker.sock:/var/run/docker.sock:ro"
    ];
    environment = {
      GLANCES_OPT = "--webserver";
    };
    autoStart = true;
    extraOptions = [ "--pid=host" ];
  };

}
