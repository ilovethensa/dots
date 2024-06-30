{...}: {
  # Configure the foot terminal program
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "FiraCode Nerd Font:size=9";
        dpi-aware = "yes";
      };

      /*
         colors = {
        foreground = "${config.colorScheme.palette.base05}"; # Text
        background = "${config.colorScheme.palette.base00}"; # Base
        regular0 = "${config.colorScheme.palette.base03}"; # Surface 1
        regular1 = "${config.colorScheme.palette.base08}"; # red
        regular2 = "${config.colorScheme.palette.base0B}"; # green
        regular3 = "${config.colorScheme.palette.base0A}"; # yellow
        regular4 = "${config.colorScheme.palette.base0D}"; # blue
        regular5 = "${config.colorScheme.palette.base0F}"; # pink
        regular6 = "${config.colorScheme.palette.base0C}"; # teal
        regular7 = "${config.colorScheme.palette.base03}"; # Subtext 1
        bright0 = "${config.colorScheme.palette.base04}"; # Surface 2
        bright1 = "${config.colorScheme.palette.base08}"; # red
        bright2 = "${config.colorScheme.palette.base0B}"; # green
        bright3 = "${config.colorScheme.palette.base0A}"; # yellow
        bright4 = "${config.colorScheme.palette.base0D}"; # blue
        bright5 = "${config.colorScheme.palette.base0F}"; # pink
        bright6 = "${config.colorScheme.palette.base0C}"; # teal
        bright7 = "${config.colorScheme.palette.base02}"; # Subtext 0
      };
      */
    };
  };
}
