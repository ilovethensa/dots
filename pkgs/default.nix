{pkgs ? import <nixpkgs> {}, ...}: {
  # example = pkgs.callPackage ./example { };
  waybar-new = pkgs.callPackage ./waybar {};
  playit = pkgs.callPackage ./playit {};
  pywhat = pkgs.callPackage ./pywhat {};
  masscan-mc = pkgs.callPackage ./masscan-mc {};
  plymouth-ecorp-glitch = pkgs.callPackage ./plymouth-ecorp-glitch {};
}
