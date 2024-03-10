{ inputs, outputs, lib, config, pkgs, ... }: {
  networking.firewall.enable = false;
  networking.dhcpcd.extraConfig = ''
    noarp
  '';
  services.printing.enable = true;

}
