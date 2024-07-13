{
  lib,
  config,
  ...
}: let
  service = "tht";
  cfg = config.services.${service};
in {
  options.services.${service} = {
    ssh = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.ssh {
    services.openssh = {
      enable = true;
      ports = [
        22
      ];
      banner = ''
        ----------------------------------------------------------------------
        |                      Official CIA spyware node                     |
        |                                                                    |
        |  This system can only by accessed by the SSH backdoor our friends  |
        |  at the NSA gave us, no other way is possible. If you dont have it |
        |  Please contact your authoritives                                  |
        |                                                                    |
        |  All activities performed on this system are logged and monitored. |
        ----------------------------------------------------------------------
      '';
      # require public key authentication for better security
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "yes";
        LogLevel = "VERBOSE";
        Ciphers = [
          "aes256-gcm@openssh.com"
          "aes256-ctr,aes192-ctr"
          "aes128-ctr"
          "aes128-gcm@openssh.com"
          "chacha20-poly1305@openssh.com"
        ];
        KexAlgorithms = [
          "curve25519-sha256"
          "curve25519-sha256@libssh.org"
          "diffie-hellman-group16-sha512"
          "diffie-hellman-group18-sha512"
          "sntrup761x25519-sha512@openssh.com"
        ];
        Macs = [
          "hmac-sha2-512-etm@openssh.com"
          "hmac-sha2-256-etm@openssh.com"
          "umac-128-etm@openssh.com"
        ];
        X11Forwarding = false;
      };
    };
    # Client side SSH configuration
    programs.ssh = {
      ciphers = [
        "aes256-gcm@openssh.com"
        "aes256-ctr,aes192-ctr"
        "aes128-ctr"
        "aes128-gcm@openssh.com"
        "chacha20-poly1305@openssh.com"
      ];
      hostKeyAlgorithms = [
        "ssh-ed25519"
        "ssh-ed25519-cert-v01@openssh.com"
        "sk-ssh-ed25519@openssh.com"
        "sk-ssh-ed25519-cert-v01@openssh.com"
        "rsa-sha2-512"
        "rsa-sha2-512-cert-v01@openssh.com"
        "rsa-sha2-256"
        "rsa-sha2-256-cert-v01@openssh.com"
      ];
      kexAlgorithms = [
        "curve25519-sha256"
        "curve25519-sha256@libssh.org"
        "diffie-hellman-group16-sha512"
        "diffie-hellman-group18-sha512"
        "sntrup761x25519-sha512@openssh.com"
      ];
      macs = [
        "hmac-sha2-512-etm@openssh.com"
        "hmac-sha2-256-etm@openssh.com"
        "umac-128-etm@openssh.com"
      ];
    };
    # Timeout TTY after 1 hour
    programs.bash.interactiveShellInit = "if [[ $(tty) =~ /dev\\/tty[1-6] ]]; then TMOUT=3600; fi";
    networking.firewall.allowedTCPPorts = [
      22
    ];
  };
}
