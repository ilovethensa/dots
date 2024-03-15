{ inputs, outputs, lib, config, pkgs, ... }: {
  home.packages = with pkgs; [
    rofi
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
