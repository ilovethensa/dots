{ inputs, outputs, lib, config, pkgs, ... }: {
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

    gnome3.adwaita-icon-theme
    qbittorrent
    vlc
    wineWowPackages.waylandFull
    protonup-qt
    mangohud
    gamescope
  ];

  # ReplaySorcery service
  services.replay-sorcery = {
    enable = true;
    autoStart = true;
    enableSysAdminCapability = true;
  };
}
