{
  pkgs,
  lib,
  config,
  ...
}: let
  service = "tht";
  cfg = config.services.${service};
in {
  options.services.${service} = {
    gaming = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.gaming {
    # Steam configurations
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
    };

    # Game-related programs and packages
    #programs.gamemode.enable = true;
    environment.systemPackages = with pkgs; [
      (lutris.override {
        extraLibraries = pkgs: [
          # List library dependencies here
        ];
        extraPkgs = pkgs: [
          # List package dependencies here
        ];
      })
      (pkgs.wrapOBS {
        plugins = with pkgs.obs-studio-plugins; [
          wlrobs
          obs-vkcapture
          obs-pipewire-audio-capture
          obs-vaapi
          obs-studio-plugins.obs-vaapi
        ];
      })

      gnome3.adwaita-icon-theme
      qbittorrent
      vlc
      wineWowPackages.waylandFull
      protonup-qt
      mangohud
      gamescope
      openjdk17
    ];
  };
}
