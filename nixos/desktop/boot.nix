{ inputs, outputs, lib, config, pkgs, ... }: {
  boot = {
    #kernelPackages = pkgs.linuxPackages_cachyos;
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;

    };
  };
  security.polkit.enable = true;
}
