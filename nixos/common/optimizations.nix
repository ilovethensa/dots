{ inputs, outputs, lib, config, pkgs, ... }: {
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    settings = { auto-optimise-store = true; };
    optimise = {
      automatic = true;
      dates = [ "03:45" ]; # Optional; allows customizing optimisation schedule

    };
  };
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L" # print build logs
    ];
    dates = "02:00";
    randomizedDelaySec = "45min";
  };

}
