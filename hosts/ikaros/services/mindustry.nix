{pkgs, ...}: {
  systemd.services.mindustry = {
    enable = true;
    description = "Mindustry server";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.mindustry-server}/bin/mindustry-server host";
      ExecStop = "pkill server-release.jar";
      #Restart = "on-failure";
      #User = "tht";
      #WorkingDirectory = "/home/tht/Mindustry";
    };
    wantedBy = ["default.target"];
  };
  networking.firewall = {
    allowedTCPPorts = [
      6567
    ];
    allowedUDPPorts = [
      6567
    ];
  };
}
