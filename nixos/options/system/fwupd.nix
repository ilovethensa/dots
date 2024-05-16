{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: let
  service = "tht";
  cfg = config.services.${service};
in {
  options.services.${service} = {
    fwupd = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.fwupd {
    services.fwupd.enable = true;
  };
}
