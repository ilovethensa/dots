{ inputs
, outputs
, lib
, config
, pkgs
, ...
}: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    gamescopeSession.enable = true;
  };
  programs.gamemode.enable = true;
  environment.systemPackages = with pkgs; [
    (lutris.override {
      extraPkgs = pkgs: [
        # List package dependencies here
      ];
      extraLibraries = pkgs: [
        # List library dependencies here
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
  # ReplaySorcery
  services.replay-sorcery = {
    enable = true;
    autoStart = true;
    enableSysAdminCapability = true;
  };
}
