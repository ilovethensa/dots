{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  /*
     environment.etc."containers/storage.conf".text = lib.mkForce ''
    [storage]

    driver = "btrfs"
  '';
  */
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
}
