{ inputs, outputs, lib, config, pkgs, spicetify-nix, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    spicetify-nix.nixosModule
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs spicetify-nix; };
    users = {
      # Import your home-manager configuration
      tht = import ../../home-manager/home.nix;
    };
  };
}
