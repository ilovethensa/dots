{
  pkgs,
  lib,
  config,
  ...
}: let
  service = "tht";
  cfg = config.services.${service};
in {
  options.services.${service} = {
    hyprland = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.hyprland {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          user = "greeter";
        };
      };
    };
    # Enable the gnome-keyring secrets vault.
    # Will be exposed through DBus to programs willing to store secrets.
    services.gnome.gnome-keyring.enable = true;
    programs.hyprland = {
      # Install the packages from nixpkgs
      enable = true;
      # Whether to enable XWayland
      xwayland.enable = true;
    };
    security.pam.services.hyprlandlock = {};
    xdg = {
      portal = {
        enable = true;
        gtkUsePortal = true;
        xdgOpenUsePortal = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-wlr
          xdg-desktop-portal-gtk
        ];
      };
    };
    security.polkit.enable = true;
    services.xserver = {
      enable = true;
      excludePackages = [pkgs.xterm];
      displayManager.startx.enable = true;
    };
    fonts.packages = with pkgs; [
      (nerdfonts.override {fonts = ["FiraCode"];})
    ];
  };
}
