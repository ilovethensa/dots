{pkgs ? import <nixpkgs> {}, ...}: {
  # example = pkgs.callPackage ./example { };
  waybar-new = pkgs.callPackage ./waybar {};
  playit = pkgs.callPackage ./playit {};
  pywhat = pkgs.callPackage ./pywhat {};
  masscan-mc = pkgs.callPackage ./masscan-mc {};
  plymouth-anonymous = pkgs.callPackage ./plymouth-anonymous {};
}
