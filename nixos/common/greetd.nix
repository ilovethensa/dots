{ inputs, outputs, lib, config, pkgs, ... }: {
  services.xserver.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.greetd}/bin/agreety --cmd Hyprland";
        user = "tht";
      };
    };
  };
}
