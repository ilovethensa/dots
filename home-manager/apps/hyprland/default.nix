{ inputs, outputs, lib, config, pkgs, ... }: {
  home.packages = with pkgs; [
    rofi
    gammastep
  ];
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
      exec = "${pkgs.psmisc}/bin/killall -SIGUSR2 .waybar-wrapped";
      "$mod" = "ALT";
      input.touchpad = {
        natural_scroll = true;
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_forever = true;
      };
      # Key bindings
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];

      bind =
        [
          "$mod, F, exec, firefox"
          ", Print, exec, ${pkgs.grimblast}/bin/grimblast copy area"
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
      windowrule = stayfocused,^(Ulauncher)$
      exec-once = gammastep-indicator - t 6500:2500 -l 42.13058:24.73996
      exec-once = waybar
    '';
  };
}
