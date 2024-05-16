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
    zram = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.zram {
    zramSwap.enable = true;
  };
}
