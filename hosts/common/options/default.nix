{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  sops,
  ...
}: {
  imports = [
    ./adb.nix
    ./battery.nix
    ./boot.nix
    ./gaming.nix
    ./home.nix
    ./misc.nix
    ./openssh.nix
    ./persist.nix
    ./security.nix
    ./sound.nix
    ./virtualization.nix
    ./gpu
  ];
  networking.firewall.enable = false;
  time.timeZone = "Europe/Sofia";
  sops.defaultSopsFile = ./../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.sshKeyPaths = ["/home/tht/.ssh/id_ed25519"];
  sops.age.keyFile = "/home/tht/.config/sops/age/keys.txt";
}
