{
  inputs,
  outputs,
  pkgs,
  spicetify-nix,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    spicetify-nix.nixosModule
    inputs.sops-nix.nixosModules.sops
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../../nixos/options
  ];

  networking.hostName = "slash"; # Define your hostname

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.fish.enable = true;
  users = {
    defaultUserShell = pkgs.fish;
    users = {
      mars = {
        isNormalUser = true;
        description = "mars";
        extraGroups = ["networkmanager" "wheel"];
        packages = with pkgs; [
          firefox
          #  thunderbird
        ];
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBPxwPORGfx1bD9W6Dq0AOkxwlx1eO7AHdO1LhhA9I/n tht" # content of authorized_keys file
          # note: ssh-copy-id will add user@your-machine after the public key
          # but we can remove the "@your-machine" part
        ];
      };
      root = {
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBPxwPORGfx1bD9W6Dq0AOkxwlx1eO7AHdO1LhhA9I/n tht" # content of authorized_keys file
          # note: ssh-copy-id will add user@your-machine after the public key
          # but we can remove the "@your-machine" part
        ];
        initialHashedPassword = "$6$dO.lQ2bJZ5PBNhju$WXDIMEWtKFSTw94iRX7Pi2HwsN6hw2q4k3D6UxJXUdMm1VsrtrqpbC/4iyiOBhU.fxWKkugP30s.RuK6IYbWN.";
      };
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  services.flatpak.enable = true;
  # List services that you want to enable:

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs spicetify-nix;};
    users = {
      # Import your home-manager configuration
      mars = import ../../home-manager/mars/home.nix;
    };
  };
  services.tht = {
    adb = true;
    battery = true;
    gaming = true;
    appimage = true;

    nix-ld = true;
    persist = true;
    sound = true;
    amd = true;
    virtualization = true;
    cinnamon = true;
  };
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  programs.nix-index.enableBashIntegration = false;
  programs.command-not-found.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
