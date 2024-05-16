{
  inputs,
  outputs,
  lib,
  config,
  spicetify-nix,
  ...
}: let
  service = "tht";
  cfg = config.services.${service};
in {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    spicetify-nix.nixosModule
  ];
  options.services.${service} = {
    home = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.home {
    home-manager = {
      extraSpecialArgs = {inherit inputs outputs spicetify-nix;};
      users = {
        # Import your home-manager configuration
        tht = import ../../../home-manager/tht/home.nix;
      };
    };
  };
}
