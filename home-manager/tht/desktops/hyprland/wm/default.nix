{pkgs, ...}: {
  home.packages = with pkgs; [
    rofi-wayland
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
        #"$mod ALT, mouse:272, resizewindow"
      ];

      bind =
        [
          "$mod, F, fullscreen"
          "$mod, S, exec, ${pkgs.grimblast}/bin/grimblast copy area"
          "$mod, D, exec, rofi -show drun"
          "$mod, Return, exec, foot"
          "$mod, Q, killactive,"
        ]
        ++ (
          # Workspace bindings
          builtins.concatLists (builtins.genList
            (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10)
        );
    };

    # Additional configurations
    extraConfig = ''
      $rosewaterAlpha = f5e0dc
      $flamingoAlpha  = f2cdcd
      $pinkAlpha      = f5c2e7
      $mauveAlpha     = cba6f7
      $redAlpha       = f38ba8
      $maroonAlpha    = eba0ac
      $peachAlpha     = fab387
      $yellowAlpha    = f9e2af
      $greenAlpha     = a6e3a1
      $tealAlpha      = 94e2d5
      $skyAlpha       = 89dceb
      $sapphireAlpha  = 74c7ec
      $blueAlpha      = 89b4fa
      $lavenderAlpha  = b4befe

      $textAlpha      = cdd6f4
      $subtext1Alpha  = bac2de
      $subtext0Alpha  = a6adc8

      $overlay2Alpha  = 9399b2
      $overlay1Alpha  = 7f849c
      $overlay0Alpha  = 6c7086

      $surface2Alpha  = 585b70
      $surface1Alpha  = 45475a
      $surface0Alpha  = 313244

      $baseAlpha      = 1e1e2e
      $mantleAlpha    = 181825
      $crustAlpha     = 11111b

      $rosewater = 0xfff5e0dc
      $flamingo  = 0xfff2cdcd
      $pink      = 0xfff5c2e7
      $mauve     = 0xffcba6f7
      $red       = 0xfff38ba8
      $maroon    = 0xffeba0ac
      $peach     = 0xfffab387
      $yellow    = 0xfff9e2af
      $green     = 0xffa6e3a1
      $teal      = 0xff94e2d5
      $sky       = 0xff89dceb
      $sapphire  = 0xff74c7ec
      $blue      = 0xff89b4fa
      $lavender  = 0xffb4befe

      $text      = 0xffcdd6f4
      $subtext1  = 0xffbac2de
      $subtext0  = 0xffa6adc8

      $overlay2  = 0xff9399b2
      $overlay1  = 0xff7f849c
      $overlay0  = 0xff6c7086

      $surface2  = 0xff585b70
      $surface1  = 0xff45475a
      $surface0  = 0xff313244

      $base      = 0xff1e1e2e
      $mantle    = 0xff181825
      $crust     = 0xff11111b

      windowrulev2 = workspace 3, class:^(Firefox)$
      windowrulev2 = workspace 4, class:^(Code)$
      windowrulev2 = workspace 2, title:^(Vesktop)$
      windowrule = stayfocused,^(Ulauncher)$
      exec-once = gammastep-indicator - t 6500:2500 -l 42.13058:24.73996
      exec-once = waybar
    '';
  };
}
