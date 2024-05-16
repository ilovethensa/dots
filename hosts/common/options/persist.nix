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
    persist = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.persist {
    environment.persistence."/nix/persist" = {
      hideMounts = true;
      directories = [
        "/var/log"
        "/var/lib/nixos"
        "/etc/NetworkManager/system-connections"
        "/var/lib/containers"
      ];
    };
    environment.etc.machine-id = {
      text = ''
        12345678901234567890123456789012
      '';
    };
  };
}
