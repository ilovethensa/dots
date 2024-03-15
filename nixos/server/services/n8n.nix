{ pkgs, lib, config, ... }:
{
  virtualisation.oci-containers.containers."n8n" = {
    image = "docker.n8n.io/n8nio/n8n";
    autoStart = true;
    volumes = [
      " :/home/node/.n8n"
    ];
    ports = [
      "5678:5678"
    ];

  };
}
