{ pkgs, lib, config, ... }:
{
  systemd.services.mindustry = {
    enable = true;
    description = "Mindustry server";
    serviceConfig = {
      Type = "forking";
      ExecStart = "${pkgs.jdk21}/bin/java -jar /home/tht/Mindustry/server-release.jar host";
      ExecStop = "pkill server-release.jar";
      Restart = "on-failure";
    };
    wantedBy = [ "default.target" ];
  };
}
