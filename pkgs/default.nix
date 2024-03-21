{ pkgs ? import <nixpkgs> { }, ... }: {
  # example = pkgs.callPackage ./example { };
  waybar-new = pkgs.callPackage ./waybar { };

}
