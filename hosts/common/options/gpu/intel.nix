{
  pkgs,
  lib,
  config,
  ...
}: let
  service = "tht.gpu";
  cfg = config.services.${service};
in {
  options.services.${service} = {
    gpu.intel = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.gpu.intel {
    nixpkgs.config.packageOverrides = pkgs: {
      intel-vaapi-driver = pkgs.intel-vaapi-driver.override {enableHybridCodec = true;};
    };
    hardware.opengl = {
      enable = true;
      extraPackages = with pkgs; [
        intel-compute-runtime # OpenCL filter support (hardware tonemapping and subtitle burn-in)
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
        intel-media-driver # LIBVA_DRIVER_NAME=iHD
        intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
        intel-ocl
        clblast
      ];
      driSupport32Bit = true;
    };
    environment.systemPackages = with pkgs; [
      intel-compute-runtime # OpenCL filter support (hardware tonemapping and subtitle burn-in)
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      intel-ocl
      clblast
    ];
    environment.sessionVariables = {LIBVA_DRIVER_NAME = "iHD";}; # Force intel-media-driver
  };
}
