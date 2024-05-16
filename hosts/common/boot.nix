{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  boot = {
    # Use a more optimized kernel
    kernelPackages = pkgs.linuxPackages_latest;
    # Enable systemd-boot
    loader = {
      systemd-boot = {
        enable = true;
        # Limit the number of generations to 5
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;
    };
  };
  security.polkit.enable = true;
}
