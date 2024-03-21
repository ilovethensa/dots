{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.cava = {
    enable = true;
    settings = {
      color = {
        gradient = 1;
        gradient_color_1 = "#${config.colorScheme.palette.base0C}";
        gradient_color_2 = "#${config.colorScheme.palette.base0D}";
        gradient_color_3 = "#${config.colorScheme.palette.base00}";
        gradient_color_4 = "#${config.colorScheme.palette.base0D}";
        gradient_color_5 = "#${config.colorScheme.palette.base0E}";
        gradient_color_6 = "#${config.colorScheme.palette.base06}";
        gradient_color_7 = "#${config.colorScheme.palette.base0E}";
        gradient_color_8 = "#${config.colorScheme.palette.base08}";

      };
    };
  };
}
