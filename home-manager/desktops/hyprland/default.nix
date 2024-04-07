{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./cava
    ./foot
    ./waybar
    ./wm
    ./mako
    ./themes.nix
  ];
}
