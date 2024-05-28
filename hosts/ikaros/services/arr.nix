{...}: {
  nixarr = {
    enable = true;
    mediaDir = "/mnt/media";
    stateDir = "/mnt/data";

    jellyfin = {
      enable = true;
      openFirewall = true;
    };
    transmission = {
      enable = true;
      peerPort = 50000;
      flood.enable = true;
      openFirewall = true;
    };
    bazarr = {
      enable = true;
      openFirewall = true;
    };
    prowlarr = {
      enable = true;
      openFirewall = true;
    };
    radarr = {
      enable = true;
      openFirewall = true;
    };
    sonarr = {
      enable = true;
      openFirewall = true;
    };
  };
  networking.firewall.allowedTCPPorts = [
    50000 # Peer port
  ];
} 
