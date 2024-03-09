{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # Luks device setup
  boot.initrd.luks.devices."luks-1ceef6a5-8bed-461c-b195-82f65a617a5c".device = "/dev/disk/by-uuid/1ceef6a5-8bed-461c-b195-82f65a617a5c";

  # Use the latest kernel
  boot.kernelPackages = pkgs.linuxPackages_cachyos;

  # Using systemd-boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}