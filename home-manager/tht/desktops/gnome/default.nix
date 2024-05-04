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
  ];
  home.file.".local/share/icons/MoreWaita/".source = inputs.morewaita;
  gtk = {
    enable = true;

    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark";
    };

    #cursorTheme = {
    #  package = pkgs.vimix-cursors;
    #  name = "Vimix-cursors";
    #};
    iconTheme.name = "MoreWaita";
    font = {
      package = pkgs.fira-code-nerdfont;
      name = "FiraCode Nerd Font";
    };
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
