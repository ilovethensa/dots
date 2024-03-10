{ inputs, outputs, lib, config, pkgs, ... }: {
  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      tht = import ../../home-manager/home.nix;
    };
  };
}
