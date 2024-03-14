{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.foot = {
    enable = true;
    settings = {
      font = "monospace:size=13";
    };
  };

}
