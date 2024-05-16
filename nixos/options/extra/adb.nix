{
  pkgs,
  lib,
  config,
  ...
}: let
  service = "tht";
  cfg = config.services.${service};
in {
  options.services.${service} = {
    adb = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.adb {
    programs.adb.enable = true;
    services.udev.packages = [
      pkgs.android-udev-rules
    ];
  };
}
