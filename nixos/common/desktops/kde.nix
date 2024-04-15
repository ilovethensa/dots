{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  services = {
    xserver = {
      enable = true;
      desktopManager.plasma6.enable = true;
    };
  };
}
