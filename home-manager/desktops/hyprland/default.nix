{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./cava
    ./waybar
    ./wm
    ./mako
    ./themes.nix
    ./../../apps/foot
  ];
}
