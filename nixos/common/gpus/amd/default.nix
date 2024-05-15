{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # Configurations for AMDGPU and ROCm setup
  # Some programs hard-code the path to HIP
  # systemd.tmpfiles.rules = [
  #   "L+ /opt/rocm/hip - - - - ${pkgs.rocmPackages_5.clr}"
  #   "L+ /etc/OpenCL - - - - /run/opengl-driver/etc/OpenCL"
  # ];
  # Enable ROCM on my RX 580
  environment = {
    variables = {
      ROC_ENABLE_PRE_VEGA = "1";
    };
    systemPackages = with pkgs; [
      clinfo
      rocmPackages_5.clr.icd
      rocmPackages_5.clr
      rocmPackages_5.rocminfo
      rocmPackages_5.rocm-runtime
    ];
  };
  # Additional hardware configurations
  services.xserver.videoDrivers = ["amdgpu"];
  boot.initrd.kernelModules = ["amdgpu"];
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages_5.clr.icd
      rocmPackages_5.clr
      rocmPackages_5.rocminfo
      rocmPackages_5.rocm-runtime
    ];
  };
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages_5.clr}"
  ];
}
