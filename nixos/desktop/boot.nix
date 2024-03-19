{ inputs, outputs, lib, config, pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_cachyos;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;

    };
  };
  security.polkit.enable = true;

}
