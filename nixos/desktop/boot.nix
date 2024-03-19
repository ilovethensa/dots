{ inputs, outputs, lib, config, pkgs, ... }: {
  boot = {
    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];
    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
    kernelPackages = pkgs.linuxPackages_cachyos;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;

    };
  };
  security.polkit.enable = true;

}
