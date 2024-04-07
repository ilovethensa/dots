{ inputs, outputs, lib, config, pkgs, ... }: {

  imports = [
    ./greetd.nix
  ];
  # Enable services
  services.dbus.enable = true;
  services.gnome.gnome-keyring.enable = true;
  # Configure xdg portal
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # Additional portals
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  programs.hyprland.enable = true; # Enable Hyprland program
  environment.variables = {
    GDK_BACKEND = "wayland,x11";
    QT_QPA_PLATFORM = "wayland;xcb";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    NIXOS_OZONE_WL = "1";
  };
  fonts.packages = with pkgs;[
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

}
