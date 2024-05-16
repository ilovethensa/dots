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
    ./autoupdate.nix
    ./boot.nix
    ./earlyoom.nix
    ./fwupd.nix
    ./persist.nix
    ./zram.nix
  ];
}
