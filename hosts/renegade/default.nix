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
    ./../common/users.nix
    ./../common/openssh.nix
    ./../common/nix-ld.nix
    ./../common/misc.nix
    ./../common/sops.nix
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
  # System state version
  system.stateVersion = "23.05";
}
