# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{lib, ...}:
with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/Console" = {
      custom-font = "DejaVu Sans Mono 10";
      last-window-size = mkTuple [652 480];
      use-system-font = false;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-l.svg";
      picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-d.svg";
      primary-color = "#241f31";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [(mkTuple ["xkb" "us"]) (mkTuple ["xkb" "bg+phonetic"])];
      xkb-options = ["terminate:ctrl_alt_bksp"];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-theme = "Adwaita";
      document-font-name = "FiraCode Nerd Font 11";
      font-antialiasing = "rgba";
      font-hinting = "full";
      font-name = "FiraCode Nerd Font";
      monospace-font-name = "FiraCode Nerd Font 10";
      show-battery-percentage = true;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = -0.5;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/privacy" = {
      disable-camera = true;
      disable-microphone = true;
      old-files-age = mkUint32 2;
      recent-files-max-age = -1;
      remember-recent-files = true;
      remove-old-temp-files = true;
      remove-old-trash-files = true;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      lock-enabled = false;
      picture-options = "zoom";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-l.svg";
      primary-color = "#241f31";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      num-workspaces = 1;
      titlebar-font = "FiraCode Nerd Font 11";
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/shell" = {
      enabled-extensions = ["appindicatorsupport@rgcjonas.gmail.com" "blur-my-shell@aunetx" "app-hider@lynith.dev"];
      favorite-apps = ["org.gnome.Nautilus.desktop" "org.gnome.Console.desktop" "firefox.desktop" "vscode.desktop"];
      last-selected-power-profile = "power-saver";
      remember-mount-password = false;
      welcome-dialog-last-shown-version = "45.5";
    };

    "org/gnome/shell/extensions/app-hider" = {
      hidden-apps = ["nixos-manual.desktop" "yelp.desktop" "org.gnome.Tour.desktop" "fish.desktop" "Proton Experimental.desktop" "Steam Linux Runtime 3.0 (sniper).desktop"];
    };
  };
}