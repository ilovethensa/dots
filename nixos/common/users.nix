{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.fish.enable = true;
  users = {
    defaultUserShell = pkgs.fish;
    mutableUsers = false;
    users = {
      root = {
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBPxwPORGfx1bD9W6Dq0AOkxwlx1eO7AHdO1LhhA9I/n tht" # content of authorized_keys file
          # note: ssh-copy-id will add user@your-machine after the public key
          # but we can remove the "@your-machine" part
        ];
        initialHashedPassword = "$6$dO.lQ2bJZ5PBNhju$WXDIMEWtKFSTw94iRX7Pi2HwsN6hw2q4k3D6UxJXUdMm1VsrtrqpbC/4iyiOBhU.fxWKkugP30s.RuK6IYbWN.";
      };
      tht = {
        isNormalUser = true;
        extraGroups = ["wheel" "render" "video"]; # Enable ‘sudo’ for the user.
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBPxwPORGfx1bD9W6Dq0AOkxwlx1eO7AHdO1LhhA9I/n tht" # content of authorized_keys file
          # note: ssh-copy-id will add user@your-machine after the public key
          # but we can remove the "@your-machine" part
        ];

        initialHashedPassword = "$6$dO.lQ2bJZ5PBNhju$WXDIMEWtKFSTw94iRX7Pi2HwsN6hw2q4k3D6UxJXUdMm1VsrtrqpbC/4iyiOBhU.fxWKkugP30s.RuK6IYbWN.";
      };
    };
  };
  #environment.variables = {
  #  NIX_PATH = lib.mkForce "nixpkgs=/nix/var/nix/profiles/per-user/root/channels"; # Until i can figure out how to fix it
  #};
}
