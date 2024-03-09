{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # Making sure it loads the amdgpu module
  services.xserver.videoDrivers = [ "amdgpu" ];
  # Setting up ROCM
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
  hardware.opengl.extraPackages = with pkgs; [
    rocmPackages.clr.icd
  ];
  # Enabling ROCM on my rx 580
  environment.variables = {
    ROC_ENABLE_PRE_VEGA = "1";
  };
  # Enabling vulkan
  hardware.opengl.driSupport = true; # This is already enabled by default
  hardware.opengl.driSupport32Bit = true; # For 32 bit applications
}