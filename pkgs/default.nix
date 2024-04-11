{ pkgs ? import <nixpkgs> { }, ... }: {
  # example = pkgs.callPackage ./example { };
  waybar-new = pkgs.callPackage ./waybar { };
  playit = pkgs.callPackage ./playit { };
  mdns-publisher = pkgs.callPackage ./mdns-publisher { };
}
