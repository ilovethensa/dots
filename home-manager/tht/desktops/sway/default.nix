{pkgs, ...}: {
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod1";
      # Use kitty as default terminal
      terminal = "${pkgs.foot}/bin/foot";
      keybindings = {
        "${modifier}+Return" = "exec ${pkgs.foot}/bin/foot";
        "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -show drun | ${pkgs.findutils}/bin/xargs swaymsg exec --";
        "${modifier}+q" = "kill";
        "${modifier}+f" = "fullscreen toggle";
        "${modifier}+1" = "workspace 1";
        "${modifier}+2" = "workspace 2";
        "${modifier}+3" = "workspace 3";
        "${modifier}+4" = "workspace 4";
        "${modifier}+5" = "workspace 5";
        "${modifier}+6" = "workspace 6";
        "${modifier}+7" = "workspace 7";
        "${modifier}+8" = "workspace 8";
        "${modifier}+9" = "workspace 9";
        "${modifier}+0" = "workspace 10";
        "${modifier}+Shift+1" = "move container to workspace 1";
        "${modifier}+Shift+2" = "move container to workspace 2";
        "${modifier}+Shift+3" = "move container to workspace 3";
        "${modifier}+Shift+4" = "move container to workspace 4";
        "${modifier}+Shift+5" = "move container to workspace 5";
        "${modifier}+Shift+6" = "move container to workspace 6";
        "${modifier}+Shift+7" = "move container to workspace 7";
        "${modifier}+Shift+8" = "move container to workspace 8";
        "${modifier}+Shift+9" = "move container to workspace 9";
        "${modifier}+Shift+0" = "move container to workspace 10";
      };
      startup = [
        {command = "${pkgs.gammastep}/bin/gammastep -o -O 2000";}
      ];
    };
    extraConfig = ''
      gaps inner 10
      default_border none
      #output * background /home/tht/Pictures/wall.png fill
      input type:touchpad {
        tap enabled
        natural_scroll enabled
      }
      bindgesture swipe:right workspace prev
      bindgesture swipe:left workspace next
    '';
  };
}
