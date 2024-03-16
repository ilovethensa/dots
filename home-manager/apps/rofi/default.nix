{ inputs, outputs, lib, config, pkgs, ... }: {
  xdg.configFile."rofi".source = ./config.rasi;
  home.file.".local/share/rofi/themes/catppuccin-mocha.rasi".source = ./catppuccin-mocha.rasi;

}
