let
  # Last updated: 2/26/21. Update as necessary from https://status.nixos.org/...
  pkgs = import (fetchTarball ("https://github.com/NixOS/nixpkgs/archive/600b15aea1b36eeb43833a50b0e96579147099ff.tar.gz")) { };

  # Rolling updates, not deterministic.
  # pkgs = import (fetchTarball("channel:nixpkgs-unstable")) {};
in
pkgs.mkShell {
  buildInputs = [
    pkgs.cargo
    pkgs.rustc
    pkgs.rustfmt

    # Necessary for the openssl-sys crate:
    pkgs.openssl
    pkgs.pkg-config
  ];

  # See https://discourse.nixos.org/t/rust-src-not-found-and-other-misadventures-of-developing-rust-on-nixos/11570/3?u=samuela.
  RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
}
