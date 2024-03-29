{ inputs, outputs, lib, config, pkgs, ... }: {
  home.packages = with pkgs;[
    grc
    (uutils-coreutils.override { prefix = ""; })
    ripgrep
    gitoxide
    fd
    tealdeer
    ouch
  ];
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      ${pkgs.starship}/bin/starship init fish | source
      ${pkgs.nitch}/bin/nitch
      function help
        curl cheat.sh/$argv | ${pkgs.less}/bin/less
      end
    '';
    shellAliases = {
      ls = "${pkgs.eza}/bin/eza -la";
      cat = "${pkgs.bat}/bin/bat";
      cp = "${pkgs.xcp}/bin/xcp";
      rm = "${pkgs.fuc}/bin/rmz";

    };
    plugins = [
      # Enable a plugin (here grc for colorized command output) from nixpkgs
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      # Manually packaging and enable a plugin
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
          sha256 = "0dbnir6jbwjpjalz14snzd3cgdysgcs3raznsijd6savad3qhijc";
        };
      }
    ];
  };

}
