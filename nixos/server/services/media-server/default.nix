{ inputs, outputs, lib, config, pkgs, ... }: {

  # Import modules and configuration pieces
  imports = [
    ./jellyfin.nix
    ./prowlarr.nix
    ./qbittorrent.nix
    ./jellyseerr.nix
    ./bazarr.nix
    ./sonarr.nix
    ./radarr.nix
  ];
}
