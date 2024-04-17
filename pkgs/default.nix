{pkgs ? import <nixpkgs> {}, ...}: {
  # example = pkgs.callPackage ./example { };
  waybar-new = pkgs.callPackage ./waybar {};
  playit = pkgs.callPackage ./playit {};
  pywhat = pkgs.callPackage ./pywhat {};
  davinci = pkgs.callPackage ./davinci {};
}
