{ inputs, outputs, lib, config, pkgs, ... }: {
  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };
}
