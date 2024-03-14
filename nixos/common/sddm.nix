{ inputs, outputs, lib, config, pkgs, ... }: {
  services.xserver.enable = true;
  services.xserver.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
  };
}
