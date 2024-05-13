{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
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
}
