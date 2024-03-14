{ inputs, outputs, lib, config, pkgs, ... }: {
  services.xserver.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
  };
}
