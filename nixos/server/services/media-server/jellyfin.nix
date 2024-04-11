{ pkgs, lib, config, ... }:
{
  # 1. enable vaapi on OS-level
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      intel-compute-runtime # OpenCL filter support (hardware tonemapping and subtitle burn-in)
    ];
  };

  # 2. do not forget to enable jellyfin
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };
  # For jellyfin.local to work
  services.nginx.virtualHosts."jellyfin.local" = {
    locations."/" = {
      proxyPass = "http://localhost:8096";
    };
  };
}
