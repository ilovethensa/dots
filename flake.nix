{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    impermanence.url = "github:nix-community/impermanence";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    nixarr.url = "github:rasmus-kirk/nixarr";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    sops-nix.url = "github:Mic92/sops-nix";
    comin.url = "github:nlewo/comin";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    morewaita = {
      url = "github:somepaulo/MoreWaita";
      flake = false;
    };

    #nix-on-droid = {
    #  url = "github:nix-community/nix-on-droid/release-23.11";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

    # TODO: Add any other flake you might need
    # hardware.url = "github:nixos/nixos-hardware";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    firefox-addons,
    impermanence,
    spicetify-nix,
    firefox-gnome-theme,
    morewaita,
    nixarr,
    nix-gaming,
    nixos-hardware,
    nix-index-database,
    sops-nix,
    comin,
    ...
  } @ inputs: let
    inherit (self) outputs;
    # Supported systems for your flake packages, shell, etc.
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;
    #secrets = builtins.fromJSON (builtins.readFile "${self}/secrets.json");
  in {
    # Your custom packages
    # Accessible through 'nix build', 'nix shell', etc
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Your custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};
    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./modules/nixos;
    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./modules/home-manager;

    templates = import ./templates;

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      # FIXME replace with your hostname
      viper = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs spicetify-nix;};
        modules = [
          # > Our main nixos configuration file <
          impermanence.nixosModules.impermanence
          nix-index-database.nixosModules.nix-index
          #nixos-hardware.nixosModules.common-gpu-amd
          #nixos-hardware.nixosModules.common-cpu-amd
          ./hosts/viper
        ];
      };
      mute = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs spicetify-nix;};
        modules = [
          # > Our main nixos configuration file <
          nix-index-database.nixosModules.nix-index
          impermanence.nixosModules.impermanence
          comin.nixosModules.comin
          ./hosts/mute
        ];
      };
      ikaros = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs spicetify-nix;};
        modules = [
          # > Our main nixos configuration file <
          impermanence.nixosModules.impermanence
          nixarr.nixosModules.default
          nix-index-database.nixosModules.nix-index
          comin.nixosModules.comin
          ./hosts/ikaros
        ];
      };
      slash = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs spicetify-nix;};
        modules = [
          # > Our main nixos configuration file <
          nix-index-database.nixosModules.nix-index
          #nixos-hardware.nixosModules.common-gpu-nvidia
          nixos-hardware.nixosModules.common-cpu-intel
          nixos-hardware.nixosModules.common-pc-ssd
          comin.nixosModules.comin
          ./hosts/slash
        ];
      };
      renegade = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs spicetify-nix;};
        modules = [
          # > Our main nixos configuration file <
          nix-index-database.nixosModules.nix-index
          #nixos-hardware.nixosModules.common-gpu-nvidia
          nixos-hardware.nixosModules.common-cpu-intel
          nixos-hardware.nixosModules.common-pc-ssd
          comin.nixosModules.comin
          ./hosts/renegade
        ];
      };
      #nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
      #  modules = [ ./hosts/pixel ];
      #};
    };
  };
}
