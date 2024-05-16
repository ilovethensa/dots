{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  spicetify-nix,
  ...
}: let
  service = "tht";
  cfg = config.services.${service};
in {
  options.services.${service} = {
    home-manager = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.home-manager {
    imports = [
      inputs.home-manager.nixosModules.home-manager
      spicetify-nix.nixosModule
    ];
    home-manager = {
      extraSpecialArgs = {inherit inputs outputs spicetify-nix;};
      users = {
        # Import your home-manager configuration
        tht = import ../../../home-manager/tht/home.nix;
      };
    };
  };
}
