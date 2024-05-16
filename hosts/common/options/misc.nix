{
  pkgs,
  lib,
  config,
  inputs,
  outputs,
  ...
}: let
  service = "tht";
  cfg = config.services.${service};
in {
  options.services.${service} = {
    autoupdate = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    optimizations = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    appimage = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    rust = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    zram = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    earlyoom = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    fwupd = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    nix-ld = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config =
    lib.mkIf cfg.autoupdate {
      services.comin = {
        enable = true;
        remotes = [
          {
            name = "origin";
            url = "https://github.com/ilovethensa/dots";
            poller.period = 60;
            branches.main.name = "master";
          }
        ];
      };
    }
    ++ lib.mkIf cfg.optimizations {
      systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
      networking.dhcpcd.extraConfig = ''
        noarp
      '';
    }
    ++ lib.mkIf cfg.appimage {
      boot.binfmt.registrations.appimage = {
        wrapInterpreterInShell = false;
        interpreter = "${pkgs.appimage-run}/bin/appimage-run";
        recognitionType = "magic";
        offset = 0;
        mask = "\\xff\\xff\\xff\\xff\\x00\\x00\\x00\\x00\\xff\\xff\\xff";
        magicOrExtension = "\\x7fELF....AI\\x02";
      };
    }
    ++ lib.mkIf cfg.rust {
      environment.variables = {
        RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}"; # Support completion in vscode
      };
    }
    ++ lib.mkIf cfg.zram {
      zramSwap.enable = true;
    }
    ++ lib.mkIf cfg.earlyoom {
      services.earlyoom = {
        enable = true;
        enableNotifications = true;
      };
    }
    ++ lib.mkIf cfg.fwupd {
      services.fwupd.enable = true;
    }
    ++ lib.mkIf cfg.nix-ld {
      programs.nix-ld.enable = true;
      programs.nix-ld.libraries = with pkgs; [
        # Add any missing dynamic libraries for unpackaged
        # programs here, NOT in environment.systemPackages
      ];
    };
}
