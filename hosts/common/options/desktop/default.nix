{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  sops,
  ...
}: {
  imports = [
    ./gnome.nix
    ./cinnamon.nix
  ];
}
