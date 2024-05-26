{
  config,
  pkgs,
  ...
}: {
  sops.secrets.playit_secret = {};
  sops.templates."playit.toml".content = ''
    secret_key = "${config.sops.placeholder.playit_secret}"
  '';
  systemd.services.playit = {
    enable = true;
    description = "Playit.gg daemon";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.playit}/bin/playit-cli --secret_path ${config.sops.templates."playit.toml".path}";
      ExecStop = "pkill playit-linux-amd64";
      #Restart = "on-failure";
      #User = "tht";
      #WorkingDir = "/home/tht/Mindustry";
    };
    wantedBy = ["default.target"];
  };
}
