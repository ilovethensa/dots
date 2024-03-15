{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [ ];
      luks.devices = {
        "luks-c4c4e3f2-1dc8-44f6-9568-b9944ca4f0cb".device = "/dev/disk/by-uuid/c4c4e3f2-1dc8-44f6-9568-b9944ca4f0cb";
        "luks-1ceef6a5-8bed-461c-b195-82f65a617a5c".device = "/dev/disk/by-uuid/1ceef6a5-8bed-461c-b195-82f65a617a5c";
      };
    };
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/" = { device = "/dev/disk/by-uuid/dc8605a1-326b-480d-8752-9c5c5c079ae9"; fsType = "ext4"; };
    "/boot" = { device = "/dev/disk/by-uuid/8AA9-A90B"; fsType = "vfat"; };
  };

  swapDevices = [{ device = "/dev/disk/by-uuid/5ddc67f8-d99a-4833-8564-9d5ccaa3bb0d"; }];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
