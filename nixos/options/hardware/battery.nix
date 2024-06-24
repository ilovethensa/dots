{
  lib,
  config,
  ...
}: let
  service = "tht";
  cfg = config.services.${service};
in {
  options.services.${service} = {
    battery = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.battery {
    services = {
      power-profiles-daemon.enable = false;
      auto-cpufreq = {
        enable = true;
        settings = {
          battery = {
            governor = "powersave";
            turbo = "never";
          };
          charger = {
            governor = "performance";
            turbo = "auto";
          };
        };
      };
    };
    powerManagement.powertop.enable = true;
  };
}
