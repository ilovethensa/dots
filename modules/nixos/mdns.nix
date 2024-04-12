# avahi-transmission.nix

{ config, pkgs, lib, ... }:

let
  # Generate systemd service for each service configuration
  makeService = cfg:
    let
      serviceName = cfg.serviceName;
      ipAddress = cfg.ipAddress;
    in
    {
      [serviceName] = {
        enable = cfg.enable;
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.avahi}/bin/avahi-publish -a ${serviceName}.local -R ${ipAddress}";
        };
      };
    };

  # Generate systemd services for all configurations
  services = lib.concatMap makeService config.networking.avahi.services;
in

{
  options = {
    networking.avahi.services = {
      default = [ ];
      type = lib.types.attrsOf (lib.types.attrsOf (lib.types.attrsOf ({ enable = lib.types.bool; ipAddress = lib.types.str; serviceName = lib.types.str; })));
      description = ''
        Configuration for Avahi services.
        Each entry specifies a service to be advertised by Avahi.
        Each service configuration must have a unique name.
      '';
    };
  };

  config = {
    networking = {
      avahi = {
        enable = true;
        services = lib.foldl' lib.mkMerge { } services;
      };
    };
  };
}
