{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  sops,
  ...
}: {
  sops.defaultSopsFile = ./../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.sshKeyPaths = ["/home/tht/.ssh/id_ed25519"];
  sops.age.keyFile = "/home/tht/.config/sops/age/keys.txt";
}
