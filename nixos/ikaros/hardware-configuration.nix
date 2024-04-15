# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "none";
    fsType = "tmpfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/3FD2-2807";
    fsType = "vfat";
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/c5dde26d-1377-4ec4-8e25-707f3ef31ed7";
    fsType = "btrfs";
    options = ["subvol=@home" "compress-force=zstd:13" "defaults" "noatime"];
  };

  fileSystems."/srv" = {
    device = "/dev/disk/by-uuid/c5dde26d-1377-4ec4-8e25-707f3ef31ed7";
    fsType = "btrfs";
    options = ["subvol=@data" "compress-force=zstd:13" "defaults" "noatime"];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/c5dde26d-1377-4ec4-8e25-707f3ef31ed7";
    fsType = "btrfs";
    options = ["subvol=@nix" "compress-force=zstd:13" "defaults" "noatime"];
  };
  fileSystems."/srv/Media" = {
    device = "/dev/disk/by-uuid/23fc1491-b1f6-4e69-82e7-6135e4c0a3f1";
    fsType = "btrfs";
    options = ["compress-force=zstd:13" "defaults" "noatime" "autodefrag" "nofail"];
  };

  swapDevices = [];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s31f6.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
