{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    grc
    #(uutils-coreutils.override { prefix = ""; })
    ripgrep
    gitoxide
    fd
    tealdeer
    crabz
    hex
    suckit
    nom
  ];
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      ${pkgs.starship}/bin/starship init fish | source
      ${pkgs.nitch}/bin/nitch
      function help
        ${pkgs.curl}/bin/curl cheat.sh/$argv | ${pkgs.less}/bin/less
      end
      function nix-init
        set -l lang $argv[1]
        set -l project_name $argv[2]

        mkdir $project_name
        cd $project_name
        nix flake init -t ~/Projects/lol/dots/#$lang
      end
    '';
    shellAliases = {
      ls = "${pkgs.eza}/bin/eza -la";
      cat = "${pkgs.bat}/bin/bat --paging=never";
      cp = "${pkgs.xcp}/bin/xcp";
      rm = "${pkgs.fuc}/bin/rmz";
      glow = "${pkgs.glow}/bin/glow --pager";
      htop = "${pkgs.bottom}/bin/btm --basic --tree --hide_table_gap --dot_marker --mem_as_value";
      ip = "${pkgs.iproute2}/bin/ip --color --brief";
      less = "${pkgs.bat}/bin/bat";
      dmesg = "${pkgs.util-linux}/bin/dmesg --human --color=always";
      tree = "${pkgs.eza}/bin/eza --tree";
      ping = "${pkgs.gping}/bin/gping";
      ask = "${pkgs.tgpt}/bin/tgpt";
    };
    plugins = [
      # Enable a plugin (here grc for colorized command output) from nixpkgs
      {
        name = "grc";
        inherit (pkgs.fishPlugins.grc) src;
      }
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
    /*
           direnv = {
      enable = true;
      enableFishIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
    */
  };
}
