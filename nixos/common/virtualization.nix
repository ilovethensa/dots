{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
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
  environment.systemPackages = with pkgs; [
    distrobox
  ];
}
