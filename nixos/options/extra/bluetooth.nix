{
  lib,
  config,
  ...
}: let
  service = "tht";
  cfg = config.services.${service};
in {
  options.services.${service} = {
    bluetooth = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.adb {
    hardware.bluetooth.enable = true; # enables support for Bluetooth
    hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  };
}
