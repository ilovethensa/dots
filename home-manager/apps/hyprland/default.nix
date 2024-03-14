{ inputs, outputs, lib, config, pkgs, ... }: {
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # gtk portal needed to make gtk apps happy
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  services.gnome.gnome-keyring.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd = {
      enable = true;
    };
    settings = {
      decoration = {
        shadow_offset = "0 5";
        "col.shadow" = "rgba(00000099)";
      };
      exec-once = "waybar";

      "$mod" = "ALT";

      bindm = [
        # mouse movements
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
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
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
    extraConfig = ''
      windowrulev2 = workspace 3, class:^(Firefox)$
      windowrulev2 = workspace 4, class:^(Code)$
      windowrulev2 = workspace 2, title:^(Vesktop)$
    '';

  };
}
