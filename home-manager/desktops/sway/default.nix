{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod1";
      # Use kitty as default terminal
      terminal = "${pkgs.foot}/bin/foot";
    };
  };
}
