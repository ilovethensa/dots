{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./../greetd.nix
  ];
  services.gnome.gnome-keyring.enable = true;
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  };
  # Classical NixOS setup
  environment.sessionVariables = {
    # only needed for Sway
    XDG_CURRENT_DESKTOP = "sway";
  };
  security.polkit.enable = true;
}
