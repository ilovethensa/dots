{pkgs, ...}: {
  programs.fish.enable = true;
  users = {
    defaultUserShell = pkgs.fish;
    mutableUsers = false;
    users = {
      root = {
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO1TqzsM18I70A0XhmBjYhryhkRFdGl6ofup92N3XNyC tht@thinkpad" # content of authorized_keys file
          # note: ssh-copy-id will add user@your-machine after the public key
          # but we can remove the "@your-machine" part
        ];
        initialHashedPassword = "$6$dO.lQ2bJZ5PBNhju$WXDIMEWtKFSTw94iRX7Pi2HwsN6hw2q4k3D6UxJXUdMm1VsrtrqpbC/4iyiOBhU.fxWKkugP30s.RuK6IYbWN.";
      };
      tht = {
        isNormalUser = true;
        extraGroups = ["wheel" "render" "video" "docker" "adbusers"]; # Enable ‘sudo’ for the user.
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO1TqzsM18I70A0XhmBjYhryhkRFdGl6ofup92N3XNyC tht@thinkpad" # content of authorized_keys file
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
