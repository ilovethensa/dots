{ config, lib, pkgs, ... }:

let
  avahiService = name: cfg:
    let
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.avahi}/bin/avahi-publish -a ${name} -R ${cfg.ip}";
        # Add any additional configurations here
      };
    in
    {
      enable = true;
      serviceConfig = serviceConfig;
    };

  caddyConfig = name: cfg:
    {
      virtualHosts = {
        "${name}".extraConfig = ''
          reverse_proxy ${cfg.port}
        '';
      };
    };

  mergeServices = services:
    let
      mergedServices = lib.mkMerge (mapAttrsToList
        (name: cfg: {
          systemd.services."avahi-${name}" = avahiService name cfg;
          services.caddy = lib.mkMerge [ services.caddy caddyConfig name cfg ];
        })
        services);
    in
    mergedServices;
in
{
  options = {
    services.mdns = {
      default = { };
      type = lib.mkOptionType {
        description = "Configuration for mdns services";
        example = ''
          services.mdns = {
            # Example usage:
            #"jellyfin.local" = {
            #  port = "8096";
            #  ip = "192.168.1.111";
            #};
          };
        '';
      };
    };
  };

  config = {
    services.mdns = { };
    systemd.services = mergeServices config.services.mdns;
  };
}
