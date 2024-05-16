default:
  just --list

lint:
  statix check .

gc:
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 7d && sudo nix store gc

repair:
  sudo nix-store --verify --check-contents --repair

secrets-edit:
  sops secrets/secrets.yaml

secrets-sync:
  for file in secrets/*; do sops updatekeys "$file"; done