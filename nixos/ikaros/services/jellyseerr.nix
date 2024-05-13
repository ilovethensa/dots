{
  pkgs,
  lib,
  config,
  ...
}: {
  #services.jellyseerr.enable = true;
  environment.persistence."/nix/persist".directories = [
    "/var/lib/jellyseerr"
  ];
}
