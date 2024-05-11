{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./dconf.nix
  ];
  home.packages = with pkgs; [
    toilet
    gnome3.adwaita-icon-theme
    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator
    gnomeExtensions.app-hider
    gnomeExtensions.gsconnect
  ];
  home.file.".local/share/icons/MoreWaita/".source = inputs.morewaita;
  gtk = {
    enable = true;

    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark";
    };

    cursorTheme = {
      package = pkgs.vimix-cursors;
      name = "Vimix-cursors";
    };
    iconTheme.name = "MoreWaita";
  };
  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt6;
    };
  };
}
