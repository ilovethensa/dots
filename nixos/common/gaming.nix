{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # Steam configurations
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };

  # Game-related programs and packages
  programs.gamemode.enable = true;
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
  # Disabled since it doesnt work on gnome(for now)
  # ReplaySorcery service
  /*
       services.replay-sorcery = {
    enable = true;
    autoStart = true;
    enableSysAdminCapability = true;
  };
  */
}
