{ pkgs, lib, config, ... }:
{
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
    wantedBy = [ "default.target" ];
  };
  services.nginx.virtualHosts = {
    "mindustry.local" = {

      locations."/".proxyPass = "http://127.0.0.1:14333";
    };
  };

}
