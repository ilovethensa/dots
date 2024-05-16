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
    ./adb.nix
    ./appimage.nix
    ./gaming.nix
    ./home.nix
    ./nix-ld.nix
    ./openssh.nix
    ./security.nix
    ./sound.nix
    ./virtualization.nix
  ];
}
