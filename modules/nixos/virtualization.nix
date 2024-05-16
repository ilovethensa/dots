{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  # Shorter name to access final settings a
  # user of hello.nix module HAS ACTUALLY SET.
  # cfg is a typical convention.
  cfg = config.services.tht.virtualization;
in {
  # Declare what settings a user of this "hello.nix" module CAN SET.
  options.services.tht.virtualization = {
    enable = mkEnableOption "Enable virtualization";
  };

  # Define what other settings, services and resources should be active IF
  # a user of this "hello.nix" module ENABLED this module
  # by setting "services.hello.enable = true;".
  config = mkIf cfg.enable {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
    virtualisation = {
      oci-containers.backend = "podman";
      podman = {
        enable = true;
        dockerCompat = true;
        dockerSocket.enable = true;
        autoPrune.enable = true;
      };
    };
  };
}
