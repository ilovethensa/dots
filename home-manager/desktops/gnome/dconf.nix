# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri =
        "file:///run/current-system/sw/share/backgrounds/gnome/blobs-l.svg";
      picture-uri-dark =
        "file:///run/current-system/sw/share/backgrounds/gnome/blobs-d.svg";
      primary-color = "#241f31";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "bg+phonetic" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      font-antialiasing = "rgba";
      font-hinting = "full";
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
      picture-uri =
        "file:///run/current-system/sw/share/backgrounds/gnome/blobs-l.svg";
      primary-color = "#241f31";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/session" = { idle-delay = mkUint32 0; };

    "org/gnome/desktop/sound" = { allow-volume-above-100-percent = true; };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      num-workspaces = 1;
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 890 550 ];
      maximized = true;
    };

    "org/gnome/settings-daemon/plugins/color" = { night-light-enabled = true; };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/shell" = {
      app-picker-layout =
        "[{'org.gnome.Geary.desktop': <{'position': <0>}>, 'org.gnome.Contacts.desktop': <{'position': <1>}>, 'org.gnome.Weather.desktop': <{'position': <2>}>, 'org.gnome.clocks.desktop': <{'position': <3>}>, 'org.gnome.Maps.desktop': <{'position': <4>}>, 'org.gnome.Extensions.desktop': <{'position': <5>}>, 'org.gnome.Photos.desktop': <{'position': <6>}>, 'org.gnome.Totem.desktop': <{'position': <7>}>, 'org.gnome.Calculator.desktop': <{'position': <8>}>, 'org.gnome.eog.desktop': <{'position': <9>}>, 'simple-scan.desktop': <{'position': <10>}>, 'org.gnome.Settings.desktop': <{'position': <11>}>, 'gnome-system-monitor.desktop': <{'position': <12>}>, 'nixos-manual.desktop': <{'position': <13>}>, 'org.gnome.TextEditor.desktop': <{'position': <14>}>, 'Utilities': <{'position': <15>}>, 'org.gnome.Tour.desktop': <{'position': <16>}>, 'yelp.desktop': <{'position': <17>}>, 'xterm.desktop': <{'position': <18>}>, 'org.gnome.Cheese.desktop': <{'position': <19>}>, 'org.gnome.Calendar.desktop': <{'position': <20>}>, 'org.gnome.Epiphany.desktop': <{'position': <21>}>}, {'org.gnome.Music.desktop': <{'position': <0>}>}]";
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "blur-my-shell@aunetx"
        "app-hider@lynith.dev"
      ];
      disabled-extensions = [ ];
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "org.gnome.Console.desktop"
        "firefox.desktop"
        "vscode.desktop"
      ];
      remember-mount-password = false;
      welcome-dialog-last-shown-version = "45.2";
    };

    "org/gnome/shell/extensions/app-hider" = {
      hidden-apps =
        [ "nixos-manual.desktop" "yelp.desktop" "org.gnome.Tour.desktop" ];
    };

  };
}
