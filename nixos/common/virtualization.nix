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
    docker = {
      enable = true;
      storageDriver = "btrfs";
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
      daemon.settings = {
        data-root = "/var/lib/docker";
      };
    };
  };
  envinronment.systemPackages = with pkgs; [
    distrobox
  ];
}
