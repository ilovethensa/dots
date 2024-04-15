{
  pkgs,
  lib,
  config,
  ...
}: {
  systemd.user.services.playit = {
    enable = true;
    description = "Playit.gg daemon";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.playit}/bin/playit-cli --secret_path /home/tht/.config/playit_gg/playit.toml";
      ExecStop = "pkill playit-linux-amd64";
      #Restart = "on-failure";
      #User = "tht";
      #WorkingDir = "/home/tht/Mindustry";
    };
    wantedBy = ["default.target"];
  };
}
