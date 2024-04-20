{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # Import modules and configuration pieces
  imports = [
    ./hardware-configuration.nix
    #./../common/kde.nix
    ./../common/sound.nix
    ./../common/openssh.nix
    ./../common/nix-ld.nix
    ./../common/desktops/cinnamon
    ./../common/boot.nix
    ./../common/misc.nix
    inputs.home-manager.nixosModules.home-manager
    spicetify-nix.nixosModule
  ];

  # Nixpkgs configuration
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
    ];
    config = {
      allowUnfree = true; # Enable unfree packages
    };
  };

  # Networking and system configurations
  networking.hostName = "slash"; # Define hostname
  networking.networkmanager.enable = true; # Enable NetworkManager
  programs.fish.enable = true;
  users = {
    defaultUserShell = pkgs.fish;
    mutableUsers = false;
    users = {
      mars = {
        isNormalUser = true;
        extraGroups = ["wheel" "render" "video"]; # Enable ‘sudo’ for the user.
        openssh.authorizedKeys.keys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDGe2E81A0Xl8wRrDTTE3uPGVWEPwXyuFWU+n0hxOU0PDCXT5Sv4ZZyphdReEeS1DS06t/vAFkD+RhDCh8Dx1xUSM/Z32UyB6SbgLwBhkIwz6VW8n0NaLq1dIH8QKiLpFvgIGi9Y0mwgtDLqqfLf5AutdwBI2hX4+Z/AMp/+w1oLHk3rsJ+jEd/OILiXNkEhsSqRTA6HUTNG1VuzmXbRE9NG1ZF1bH9LbX7gv40NuYy7r8ojvfKjov2G29dGVG+nva+n4AXHnRBMFjMHM8D9oyxZxf3VmeCVy8HS7UJ0rrAHkYEI+3BduBrL1vD+e3hzGIlmjwW+3a9w6c2t05KTY2MwoDL0hvOogXZc3rzYJhn5KiLqUmM3J2tDxQpHzMUzCo+lSLlK84W2N6LHpR/rdSkF4E9Fot17ockt85kYSQHvTzPi0rlLykOKdaLAx+CBKr5iseOQCJ+PyfmUmzXNwt6qEtLfkuZdBV0I3Ax1F0BIaOZdhDmOE08HLOVrxRPc/7KehlMgCg0+3rC6b6w5IBux27eqFIdjiZP83KmkgaCTMgD3LbE6uzu49Q5Qym5h10uMgmMQW692e4XWeu+ifi25VfqPZ19HSqgPYeX06VMCNKrRAZYoST6OooUe3wnhgXEDRMM2Q/Lj679FyRhTpwf7MduJYjeYxCXzkfZzcpNSQ == tht" # content of authorized_keys file
          # note: ssh-copy-id will add user@your-machine after the public key
          # but we can remove the "@your-machine" part
        ];
        initialHashedPassword = "$6$Zpg9tmqsppD0kRQj$oS8x44xqFWF0RE9cZ6kFeb1W7.ONS7034691wh8eE01vuuo0cp6npoTJpEaAQJAm8A8my6tYWdjzseSL1DfY00";
      };
    };
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs spicetify-nix;};
    users = {
      # Import your home-manager configuration
      tht = import ../../home-manager/mars/home.nix;
    };
  };

  # System state version
  system.stateVersion = "23.05";
}
