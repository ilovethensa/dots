{ inputs, outputs, lib, config, pkgs, ... }: {

  # Enable services
  services.dbus.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # Configure xdg portal
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # Additional portals
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Configure Wayland window manager
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    # Enable systemd service
    systemd = {
      enable = true;
    };

    # Window manager settings
    settings = {
      decoration = {
        rounding = 20;
        blur = {
          enabled = true;
          xray = true;
          special = false;
          new_optimizations = true;
          size = 5;
          passes = 4;
          brightness = 1;
          noise = 0.01;
          contrast = 1;
        };
        drop_shadow = false;
        shadow_ignore_window = true;
        shadow_range = 20;
        shadow_offset = [ 0 2 ];
        shadow_render_power = 2;
        col = { shadow = "rgba(0000001A)"; };
        dim_inactive = false;
        dim_strength = 0.1;
        dim_special = 0;
      };

      exec-once = "waybar";
      "$mod" = "ALT";

      # Key bindings
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];

      bind =
        [
          "$mod, F, exec, firefox"
          ", Print, exec, grimblast copy area"
          "$mod, D, exec, rofi -show drun"
          "$mod, Return, exec, foot"
          "$mod, Q, killactive,"
        ]
        ++ (
          # Workspace bindings
          builtins.concatLists (builtins.genList
            (
              x:
              let
                ws =
                  let
                    c = (x + 1) / 10;
                  in
                  builtins.toString (x + 1 - (c * 10));
              in
              [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10)
        );
    };

    # Additional configurations
    extraConfig = ''
      windowrulev2 = workspace 3, class:^(Firefox)$
      windowrulev2 = workspace 4, class:^(Code)$
      windowrulev2 = workspace 2, title:^(Vesktop)$
    '';
  };
}
