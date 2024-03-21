{ inputs, outputs, lib, config, pkgs, spicetify-nix, ... }: {
  home-manager = {
    extraSpecialArgs = { inherit inputs outputs spicetify-nix; };
    users = {
      # Import your home-manager configuration
      tht = import ../../home-manager/home.nix;
    };
  };
}
