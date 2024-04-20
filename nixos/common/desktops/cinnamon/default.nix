{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  services.xserver.desktopManager.cinnamon.enable = true;
}
