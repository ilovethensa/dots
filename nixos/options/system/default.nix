{...}: {
  imports = [
    ./autoupdate.nix
    ./boot.nix
    ./earlyoom.nix
    ./fwupd.nix
    ./persist.nix
    ./zram.nix
  ];
}
