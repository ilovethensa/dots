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
    earlyoom = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.earlyoom {
    services.earlyoom = {
      enable = true;
      enableNotifications = true;
    };
  };
}
