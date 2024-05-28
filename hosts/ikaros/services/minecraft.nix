{...}: {
  virtualisation.oci-containers.containers."commiemc" = {
    image = "itzg/minecraft-server";
    autoStart = true;
    ports = [
      "25565:25565"
    ];
    volumes = [
      "/mnt/data/minecraft/commiemc:/data"
    ];
    extraOptions = [
      "--tty"
    ];
    environment = {
      EULA = "TRUE";
      TYPE = "FABRIC";
      ONLINE_MODE = "FALSE";
      SERVER_NAME = "CommieMC";
      USE_AIKAR_FLAGS = "true";
      MEMORY = "3G";
      PACKWIZ_URL = "https://raw.githubusercontent.com/ilovethensa/better-vanilla/main/pack.toml";
    };
  };
  networking.firewall = {
    allowedTCPPorts = [
      25565
    ];
    allowedUDPPorts = [
      19132
    ];
  };
}
