{ inputs, outputs, lib, config, pkgs, ... }: {
  # Networking configurations
  networking = {
    firewall.enable = false;
    dhcpcd.extraConfig = ''
      noarp
    '';
  };

  # Printing service enabled
  services.printing.enable = true;
}
