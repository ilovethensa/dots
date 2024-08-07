{
  description = "A basic flake with a shell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          python3
          uv
        ];
        shellHook = ''
          if [ ! -d ".venv" ]; then
              echo "Creating virtual environment..."
              uv venv
          fi
          source ".venv/bin/activate"
        '';
      };
    });
}
