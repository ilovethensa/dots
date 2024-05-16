{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar-new;
    style = ''
      /*
        @import "catppuccin/mocha.css";
      */

      /*
      * Catppuccin Mocha palette
      */

      @define-color base #1e1e2e;
                    @define-color mantle #181825;
                    @define-color crust #11111b;

                    @define-color text #cdd6f4;
                    @define-color subtext0 #a6adc8;
                    @define-color subtext1 #bac2de;

                    @define-color surface0 rgba(22, 25, 37, 0.9);
                    @define-color surface1 #45475a;
                    @define-color surface2 #585b70;
                    @define-color surface3 #394161;

                    @define-color overlay0 #6c7086;
                    @define-color overlay1 #7f849c;
                    @define-color overlay2 #9ba3c3;

                    @define-color blue #89b4fa;
                    @define-color lavender #b4befe;
                    @define-color sapphire #74c7ec;
                    @define-color sky #89dceb;
                    @define-color teal #94e2d5;
                    @define-color green #a6e3a1;
                    @define-color yellow #f9e2af;
                    @define-color peach #fab387;
                    @define-color maroon #eba0ac;
                    @define-color red #f38ba8;
                    @define-color mauve #cba6f7;
                    @define-color pink #f5c2e7;
                    @define-color flamingo #f2cdcd;
                    @define-color rosewater #f5e0dc;

                    /* =============================== */
                    /* Universal Styling */
                    * { border: none;
                    border-radius: 0;
                    font-family: 'CaskaydiaCove Nerd Font', monospace;
                    font-size: 13px;
                    min-height: 0;
                    }

      /* =============================== */


      /* =============================== */
      /* Bar Styling */
      #waybar {
      background: transparent;
      color: @text;
      }

      /* =============================== */


      /* =============================== */
      /* Main Modules */
      #custom-launcher,
      #workspaces,
      #window,
      #tray,
      #backlight,
      #clock,
      #battery,
      #pulseaudio,
      #network,
      #mpd,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #custom-music,
      #custom-updates,
      #custom-nordvpn,
      #custom-notifications,
      #custom-power,
      #custom-custom,
      #custom-cycle_wall,
      #custom-clipboard,
      #custom-ss,
      #custom-weather {
      background-color: @surface0;
      color: @text;
      border-radius: 16px;
      padding: 0.5rem 1rem;
      box-shadow: rgba(0, 0, 0, 0.116) 2px 2px 5px 2px;
      margin-top: 10px;
      /*
        margin-bottom: 10px;
      */
      margin-right: 10px;
      }

      /* =============================== */
      /* Launcher Module */
      #custom-launcher {
      color: @green;
      padding-top: 0px;
      padding-bottom: 0px;
      padding-right: 10px;
      }

      /* =============================== */
      /* Workspaces */
      #workspaces {
      padding-left: 8px;
      padding-right: 8px;
      }

      #workspaces * {
      font-size: 0px;
      }

      #workspaces button {
      background-color: @surface3;
      color: @mauve;
      border-radius: 100%;
      min-height: 14px;
      min-width: 14px;
      margin: 5px 8px;
      padding: 0px;
      /*transition: all 0.5s cubic-bezier(0.33, 1.0, 0.68, 1.0); easeInOutCubic */
      transition: all 0.5s cubic-bezier(.55, -0.68, .48, 1.68);
      box-shadow: rgba(0, 0, 0, 0.288) 2px 2px 5px 2px;
      }

      #workspaces button.active {
      /*color: @surface0;
        border-radius: 1rem;
          padding: 0rem 10px;*/
      background: radial-gradient(circle, rgba(203, 166, 247, 1) 0%, rgba(193, 168, 247, 1) 12%, rgba(249, 226, 175, 1) 19%, rgba(189, 169, 247, 1) 20%, rgba(182, 171, 247, 1) 24%, rgba(198, 255, 194, 1) 36%, rgba(177, 172, 247, 1) 37%, rgba(170, 173, 248, 1) 48%, rgba(255, 255, 255, 1) 52%, rgba(166, 174, 248, 1) 52%, rgba(160, 175, 248, 1) 59%, rgba(148, 226, 213, 1) 66%, rgba(155, 176, 248, 1) 67%, rgba(152, 177, 248, 1) 68%, rgba(205, 214, 244, 1) 77%, rgba(148, 178, 249, 1) 78%, rgba(144, 179, 250, 1) 82%, rgba(180, 190, 254, 1) 83%, rgba(141, 179, 250, 1) 90%, rgba(137, 180, 250, 1) 100%);
      background-size: 400% 400%;
      animation: gradient_f 20s ease-in-out infinite;
      transition: all 0.3s cubic-bezier(.55, -0.68, .48, 1.682);
      }

      #workspaces button:hover {
      background-color: @mauve;
      }

      @keyframes gradient {
      0% {
      background-position: 0% 50%;
      }

      50% {
      background-position: 100% 30%;
      }

      100% {
      background-position: 0% 50%;
      }
      }

      @keyframes gradient_f {
      0% {
      background-position: 0% 200%;
      }

      50% {
      background-position: 200% 0%;
      }

      100% {
      background-position: 400% 200%;
      }
      }

      @keyframes gradient_f_nh {
      0% {
      background-position: 0% 200%;
      }

      100% {
      background-position: 200% 200%;
      }
      }

      /* =============================== */


      /* =============================== */
      /* System Monitoring Modules */
      #cpu,
      #memory,
      #temperature {
      color: @blue;
      }

      #cpu {
      border-top-right-radius: 0;
      border-bottom-right-radius: 0;
      margin-right: 0px;
      padding-right: 5px;
      }

      #memory {
      border-radius: 0px;
      margin-right: 0px;
      padding-left: 5px;
      padding-right: 5px;
      }

      #temperature {
      border-radius: 0px;
      margin-right: 0px;
      padding-left: 5px;
      padding-right: 5px;
      }

      #disk {
      color: @peach;
      border-top-left-radius: 0;
      border-bottom-left-radius: 0;
      padding-left: 5px;
      padding-right: 1rem;
      }

      /* Updates Module */
      #custom-updates {
      color: @sky;
      }

      /* =============================== */


      /* =============================== */
      /* Clock Module */
      #clock {
      color: @flamingo;
      }

      /* =============================== */


      #custom-music.low {
      background: rgb(148, 226, 213);
      background: linear-gradient(52deg, rgba(148, 226, 213, 1) 0%, rgba(137, 220, 235, 1) 19%, rgba(116, 199, 236, 1) 43%, rgba(137, 180, 250, 1) 56%, rgba(180, 190, 254, 1) 80%, rgba(186, 187, 241, 1) 100%);
      background-size: 300% 300%;
      text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.377);
      animation: gradient 15s ease infinite;
      font-weight: bold;
      color: #fff;
      }

      #custom-music.random {
      background: rgb(148, 226, 213);
      background: radial-gradient(circle, rgba(148, 226, 213, 1) 0%, rgba(156, 227, 191, 1) 21%, rgba(249, 226, 175, 1) 34%, rgba(158, 227, 186, 1) 35%, rgba(163, 227, 169, 1) 59%, rgba(148, 226, 213, 1) 74%, rgba(164, 227, 167, 1) 74%, rgba(166, 227, 161, 1) 100%);
      background-size: 400% 400%;
      animation: gradient_f 4s ease infinite;
      text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.377);
      font-weight: bold;
      color: #fff;
      }

      #custom-music.critical {
      background: rgb(235, 160, 172);
      background: linear-gradient(52deg, rgba(235, 160, 172, 1) 0%, rgba(243, 139, 168, 1) 30%, rgba(231, 130, 132, 1) 48%, rgba(250, 179, 135, 1) 77%, rgba(249, 226, 175, 1) 100%);
      background-size: 300% 300%;
      animation: gradient 15s cubic-bezier(.55, -0.68, .48, 1.68) infinite;
      text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.377);
      font-weight: bold;
      color: #fff;
      }

      #custom-music.Playing {
      background: rgb(137, 180, 250);
      background: radial-gradient(circle, rgba(137, 180, 250, 120) 0%, rgba(142, 179, 250, 120) 6%, rgba(148, 226, 213, 1) 14%, rgba(147, 178, 250, 1) 14%, rgba(155, 176, 249, 1) 18%, rgba(245, 194, 231, 1) 28%, rgba(158, 175, 249, 1) 28%, rgba(181, 170, 248, 1) 58%, rgba(205, 214, 244, 1) 69%, rgba(186, 169, 248, 1) 69%, rgba(195, 167, 247, 1) 72%, rgba(137, 220, 235, 1) 73%, rgba(198, 167, 247, 1) 78%, rgba(203, 166, 247, 1) 100%);
      background-size: 400% 400%;
      animation: gradient_f 9s cubic-bezier(.72, .39, .21, 1) infinite;
      text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.377);
      font-weight: bold;
      color: #fff;
      }

      #custom-music.Paused,
      #custom-music.Stopped {
      background: @surface0;
      }


      /* =============================== */
      /* Music/PlayerCTL Module */
      #custom-music {
      color: @mauve;
      }

      /* =============================== */


      /* =============================== */
      /* Network Module */
      #network {
      color: @blue;
      border-top-right-radius: 0;
      border-bottom-right-radius: 0;
      margin-right: 0px;
      padding-right: 5px;
      }

      /* =============================== */


      /* =============================== */
      /* PulseAudio Module */
      #custom-notifications {
      color: @mauve;
      border-radius: 0;
      margin-right: 0px;
      padding-left: 5px;
      padding-right: 5px;
      }

      /* =============================== */


      /* =============================== */
      /* Backlight Module */
      #backlight {
      color: @teal;
      border-radius: 0;
      margin-right: 0px;
      padding-left: 5px;
      padding-right: 5px;
      }

      /* =============================== */


      /* =============================== */
      /* Battery Module */
      #battery {
      color: @green;
      border-radius: 0;
      margin-right: 0px;
      padding-left: 5px;
      padding-right: 5px;
      }

      #battery.charging {
      color: @green;
      }

      #battery.warning:not(.charging) {
      color: @maroon;
      }

      #battery.critical:not(.charging) {
      color: @red;
      animation-name: blink;
      animation-duration: 1s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
      }

      @keyframes blink {
      to {
      background: @red;
      color: @surface1;
      }
      }

      /* =============================== */

      /* Notifications Module */
      #custom-notifications {
      color: @mauve;
      border-top-left-radius: 0;
      border-bottom-left-radius: 0;
      padding-left: 5px;
      padding-right: 1.25rem;
      }


      /* =============================== */
      /* Tray Module */
      #tray {
      color: @mauve;
      padding-right: 1.25rem;
      }

      /* =============================== */


      /* =============================== */
      /* |       Custom Modules        | */
      /* =============================== */
      #custom-custom {
      color: @peach;
      padding-right: 1.25rem;
      margin-right: 0px;
      }

      /* Screenshot */
      #custom-ss {
      color: @mauve;
      padding-right: 1.5rem;
      }

      /* Wallpaper */
      #custom-cycle_wall {
      background: linear-gradient(45deg, rgba(245, 194, 231, 1) 0%, rgba(203, 166, 247, 1) 0%, rgba(243, 139, 168, 1) 13%, rgba(235, 160, 172, 1) 26%, rgba(250, 179, 135, 1) 34%, rgba(249, 226, 175, 1) 49%, rgba(166, 227, 161, 1) 65%, rgba(148, 226, 213, 1) 77%, rgba(137, 220, 235, 1) 82%, rgba(116, 199, 236, 1) 88%, rgba(137, 180, 250, 1) 95%);
      background-size: 500% 500%;
      animation: gradient 7s linear infinite;
      }

      /* Notifications Module */
      #custom-clipboard {
      color: @mauve;
      border-top-right-radius: 0;
      border-bottom-right-radius: 0;
      margin-right: 0px;
      padding-right: 8px;
      }

      /* Powermenu Module */
      #custom-power {
      color: @mauve;
      /* border-top-left-radius: 0;
        border-bottom-left-radius: 0;
        padding-left: 8px; */
      padding-right: 1.20rem;
      }
      /* Powermenu Module */
      #pulseaudio {
      color: @peach;
      border-top-left-radius: 0;
      border-bottom-left-radius: 0;
      padding-left: 5px;
      padding-right: 1rem;
      }


      /* =============================== */

    '';
    settings = {
      mainBar = {
        layer = "top"; # Waybar at top layer
        position = "top"; # Waybar position (top|bottom|left|right)
        # "gtk-layer-shell" = "false";
        #height = 45; # Waybar height (to be removed for auto height)
        # width = 2560;              # Waybar width
        spacing = 0; # Gaps between modules (0px) Adjusted in the css
        margin-top = 0;
        # margin-bottom = -10;
        margin-left = 10;
        margin-right = 10;
        # Choose the order of the modules
        modules-left = [
          "custom/launcher"
          "hyprland/workspaces"
          "cpu"
          "memory"
          #"temperature"
          "disk"
          "custom/updates"
        ];
        #modules-center = [
        #  "custom/music"
        #];
        modules-right = [
          "network"
          "battery"
          "pulseaudio"
          #"backlight"
          #"custom/notifications"
          "tray"
          "clock"

          #"network"
          #"pulseaudio"
          #"custom/notifications"
          #"tray"
          #"cpu"
          #"clock"
          # "custom/weather"
          # "custom/cycle_wall"
          # "custom/clipboard"
          "custom/power"
          # "custom/custom"
        ];
        "custom/launcher" = {
          format = "{}";
          tooltip = true;
          exec = "echo '{\"text\":\"💧\",\"tooltip\":\"Drun | Run\"}'";
          return-type = "json";
          on-click = "pkill tofi || sleep 0.15 && tofi-drun -c ~/.config/tofi/tofi.launcher.conf";
          on-click-right = "pkill tofi || sleep 0.15 && tofi-run -c ~/.config/tofi/tofi.launcher.conf";
          # on-click = "pkill wofi || wofi --show drun -n";
          # on-click-right = "pkill wofi || wofi --show run -n";
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            urgent = "";
            active = "";
            default = "";
          };
          sort-by-number = true;
        };
        "cpu" = {
          format = "💻 {usage}%";
          tooltip = true;
          on-click = "foot nix-shell - p btop - -command btop";
          interval = 2;
        };
        "memory" = {
          format = "🚃 {}%";
          tooltip = true;
          on-click = "foot nix-shell - p btop - -command btop";
          interval = 2;
        };
        "temperature" = {
          # thermal-zone = 2;
          # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 40;
          format-critical = "{icon} {temperatureC}°C";
          format = "{icon} {temperatureC}°C";
          /*
                       format-icons = [
            "";
            "";
            "";
          ];
          */
          tooltip = true;
          on-click = "foot nix-shell -p btop --command btop";
          interval = 2;
        };
        "disk" = {
          format = "💾 {percentage_used}% ({free})";
          tooltip = true;
          on-click = "foot nix-shell -p btop --command btop";
          interval = 2;
        };
        "custom/updates" = {
          format = "{}";
          exec = "~/.scripts/updates";
          on-click = "~/.scripts/updates update";
          interval = 600;
          tooltip = true;
          # tooltip-format = "{}";
          # exec-tooltip = "~/.scripts/updates tooltip";
        };
        "custom/music" = {
          format = "{icon}{";
          format-icons = {
            # "Playing" = " "; # Uncomment if not using the dynamic script
            Paused = " ";
            Stopped = "&#x202d;ﭥ "; # This stop symbol is RTL. So &#x202d; is left-to-right override.
          };
          escape = true;
          tooltip = true;
          exec = "~/.scripts/caway -b 10 -e";
          return-type = "json";
          on-click = "playerctl play-pause";
          on-scroll-up = "playerctl previous";
          on-scroll-down = "playerctl next";
          on-click-right = "amberol";
          max-length = 35;
        };
        "hyprland/window" = {
          format = "{}";
          separate-outputs = true;
          max-length = 35;
        };
        "network" = {
          # interface = "wlp2*"; # (Optional) To force the use of this interface
          format = "↕{bandwidthTotalBytes}";
          format-disconnected = "{icon} No Internet";
          format-linked = " {ifname} (No IP)";
          format-alt = "↕{bandwidthUpBytes} | ↕{bandwidthDownBytes}";
          tooltip-format = "{ifname}: {ipaddr}/{cidr}  {gwaddr}";
          tooltip-format-wifi = "{icon} {essid} ({signalStrength}%)";
          tooltip-format-ethernet = "{icon} {ipaddr}/{cidr}";
          tooltip-format-disconnected = "{icon} Disconnected";
          on-click-right = "nm-connection-editor";
          format-icons = {
            ethernet = "";
            disconnected = "⚠";
            /*
                           wifi = [
              "睊";
              "直";
            ];
            */
          };
          interval = 2;
        };
        "pulseaudio" = {
          # scroll-step = 1; # %, can be a float
          format = "🔊 {volume}%"; # {format_source}
          format-bluetooth = "{icon} {volume}%"; # {format_source}
          format-bluetooth-muted = ""; # {format_source}
          format-muted = "🔇"; # {format_source}
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            headset = "";
            phone = "";
            portable = "";
            car = " ";
            /*
                           default = [
              "";
              "";
              "";
            ];
            */
          };
          on-click = "pavucontrol";
        };
        "backlight" = {
          # device = "acpi_video1";
          format = "{icon} {percent}%";
          /*
                       format-icons = [
            "";
            "";
            "";
            "";
            "";
            "";
            "";
            "";
            "";
          ];
          */
          on-scroll-up = "light -A 1";
          on-scroll-down = "light -U 1";
          interval = 2;
        };
        "battery" = {
          states = {
            good = 100;
            warning = 30;
            critical = 10;
          };
          format = "{icon} {capacity}%";
          format-charging = "⚡ {capacity}%";
          format-plugged = "🔌 {capacity}%";
          format-alt = "{icon} {time}";
          # format-good = ""; # An empty format will hide the module
          format-full = "🔋 {capacity}%";
          /*
                       format-icons = [
            "";
            "";
            "";
            "";
            "";
            "";
            "";
            "";
            "";
            "";
          ];
          */
          interval = 2;
        };
        "custom/notifications" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = "<span foreground='red'><sup></sup></span>";
            none = "";
            dnd-notification = "<span foreground='red'><sup></sup></span>";
            dnd-none = "";
          };
          return-type = "json";
          #exec-if = "which swaync-client";
          exec = "echo \"lol\"";
          on-click = "sleep 0.15 && swaync-client -t -sw";
          on-click-right = "sleep 0.15 && swaync-client -d -sw";
          escape = true;
        };
        "tray" = {
          icon-size = 15;
          spacing = 15;
        };
        "clock" = {
          timezone = "Europe/Sofia";
          format = "🕓 {:%d <small>%a</small> %H:%M}";
          # format = " {:%a %b %d %Y | %H:%M}";
          format-alt = "🕓 {:%A %B %d %Y (%V) | %r}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          calendar-weeks-pos = "right";
          today-format = "<span color='#f38ba8'><b><u>{}</u></b></span>";
          format-calendar = "<span color='#f2cdcd'><b>{}</b></span>";
          format-calendar-weeks = "<span color='#94e2d5'><b>W{:%U}</b></span>";
          format-calendar-weekdays = "<span color='#f9e2af'><b>{}</b></span>";
          interval = 60;
        };
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
        "custom/weather" = {
          tooltip = true;
          format = "{}";
          exec = "~/.scripts/tools/expand weather";
          return-type = "json";
        };
        "custom/ss" = {
          format = "{}";
          exec = "~/./scripts/tools/expand ss-icon";
          return-type = "json";
          on-click = "~/.scripts/screenshot_full";
        };
        "custom/cycle_wall" = {
          format = "{}";
          exec = "~/.scripts/tools/expand wall";
          return-type = "json";
          # interval = 1;
          on-click = "~/.scripts/tools/expand cycle";
          on-click-right = "~/.scripts/tools/expand cycler";
        };
        "custom/clipboard" = {
          format = "{}";
          exec = "~/.scripts/tools/expand clipboard";
          return-type = "json";
          # Window position is managed in Hyperland config's windowrulev2
          on-click = "pkill tofi || sleep 0.15 && cliphist list | tofi -c ~/.config/tofi/tofi.clip.conf | cliphist decode | wl-copy";
          on-click-middle = "rm -f ~/.cache/cliphist/db";
          on-click-right = "pkill tofi || sleep 0.15 && cliphist list | tofi -c ~/.config/tofi/tofi.clip.conf | cliphist delete";
          # Here "-l top_right -x -15 -y 10" doesn't matter as '-n' mode is used
          # on-click = "pkill wofi || cliphist list | wofi --dmenu -p clippick -l top_right -x -15 -y 10 -n | cliphist decode | wl-copy";
          # on-click-middle = "rm -f ~/.cache/cliphist/db";
          # on-click-right = "pkill wofi || cliphist list | wofi --dmenu -p clippick -l top_right -x -15 -y 10 -n | cliphist delete";
          escape = true;
        };
        "custom/power" = {
          format = "{}";
          # exec = "~/.scripts/tools/expand power";
          exec = "echo '{\"text\":\"⏻\",\"tooltip\":\"Power\"}'";
          return-type = "json";
          on-click = "~/.config/wlogout/launch.sh";
        };
        "custom/custom" = {
          format = "{}";
          exec = "~/.scripts/tools/expand arrow-icon";
          on-click = "~/.scripts/tools/expand_toolbar";
          return-type = "json";
        };
      };
    };
  };
}
