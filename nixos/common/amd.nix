{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # Configurations for AMDGPU and ROCm setup
  services.xserver.videoDrivers = ["amdgpu"];
  # Some programs hard-code the path to HIP
  systemd.tmpfiles.rules = ["L+ /opt/rocm/hip - - - - ${pkgs.rocmPackages.clr}"];
  # Enable ROCM on my RX 580
  environment.variables = {ROC_ENABLE_PRE_VEGA = "1";};

  # Additional hardware configurations
  hardware = {
    opengl = {
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [rocmPackages.clr.icd];
    };
  };
}
