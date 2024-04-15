{
  pkgs,
  lib,
  config,
  ...
}: {
  services.caddy = {
    enable = true;
  };
}
