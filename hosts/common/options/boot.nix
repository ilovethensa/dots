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
    systemd-boot = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.systemd-boot {
    boot = {
      # Use a more optimized kernel
      kernelPackages = pkgs.linuxPackages_latest;
      # Enable systemd-boot
      loader = {
        systemd-boot = {
          enable = true;
          # Limit the number of generations to 5
          configurationLimit = 5;
        };
        efi.canTouchEfiVariables = true;
      };
    };
    security.polkit.enable = true;
  };
}
