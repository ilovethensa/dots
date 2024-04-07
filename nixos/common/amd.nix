{ inputs
, outputs
, lib
, config
, pkgs
, ...
}: {

  # Configurations for AMDGPU and ROCm setup
  services.xserver.videoDrivers = [ "amdgpu" ];
  systemd.tmpfiles.rules = [ "L+ /opt/rocm/hip - - - - ${pkgs.rocmPackages.clr}" ];
  environment.variables = { ROC_ENABLE_PRE_VEGA = "1"; };

  # Additional hardware configurations
  hardware = {
    opengl = {
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [ rocmPackages.clr.icd ];
    };
  };
}
