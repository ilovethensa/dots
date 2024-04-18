{
  pkgs,
  lib,
  config,
  secrets,
  ...
}: {
  nixarr = {
    enable = true;
    mediaDir = "/srv/Media";
    stateDir = "/srv/data";

    jellyfin.enable = true;
    transmission = {
      enable = true;
      peerPort = 50000;
    };
    bazarr.enable = true;
    prowlarr.enable = true;
    radarr.enable = true;
    sonarr.enable = true;
  };
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override {enableHybridCodec = true;};
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
}
