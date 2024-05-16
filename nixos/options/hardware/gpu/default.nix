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
    ./amd.nix
    ./nvidia.nix
    ./intel.nix
  ];
}
