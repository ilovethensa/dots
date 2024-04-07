{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    impermanence.url = "github:nix-community/impermanence";
    spicetify-nix.url = "github:the-argus/spicetify-nix";

    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
    home-manager = {
      url =
        "https://github.com/nix-community/home-manager/archive/master.tar.gz";
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

  outputs =
    { self
    , nixpkgs
    , home-manager
    , chaotic
    , firefox-addons
    , impermanence
    , spicetify-nix
    , firefox-gnome-theme
    , morewaita
    , ...
    }@inputs:
    let
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
      secrets = builtins.fromJSON (builtins.readFile "${self}/secrets.json");
    in
    {
      # Your custom packages
      # Accessible through 'nix build', 'nix shell', etc
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      # Formatter for your nix files, available through 'nix fmt'
      # Other options beside 'alejandra' include 'nixpkgs-fmt'
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

      # Your custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit inputs; };
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
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs secrets spicetify-nix; };
          modules = [
            # > Our main nixos configuration file <
            chaotic.nixosModules.default
            ./nixos/desktop
          ];
        };
        thinkpad = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs secrets spicetify-nix; };
          modules = [
            # > Our main nixos configuration file <
            chaotic.nixosModules.default
            ./nixos/thinkpad
          ];
        };
        server = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs secrets spicetify-nix; };
          modules = [
            # > Our main nixos configuration file <
            chaotic.nixosModules.default
            impermanence.nixosModules.impermanence
            ./nixos/server
          ];
        };
        #nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
        #  modules = [ ./nixos/pixel ];
        #};

      };
    };
}
