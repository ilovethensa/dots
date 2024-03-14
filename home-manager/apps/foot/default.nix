{ inputs, outputs, lib, config, pkgs, ... }: {
  home.packages = [
    pkgs.fira-code
  ];
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";

        font = "Fira Code:size=13";
        dpi-aware = "yes";
      };
    };

  };

}
