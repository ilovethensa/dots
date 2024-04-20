# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    spicetify-nix.nixosModule
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../common/desktops/cinnamon
    ./../common/boot.nix
    ./../common/networking.nix
    ./../common/sound.nix
    ./../common/misc.nix
    ./../common/openssh.nix
    ./../common/nvidia.nix
    ./../common/gaming.nix
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

  # List services that you want to enable:

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs spicetify-nix;};
    users = {
      # Import your home-manager configuration
      tht = import ../../home-manager/mars/home.nix;
    };
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
