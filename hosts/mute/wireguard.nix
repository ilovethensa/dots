{config, ...}: {
  sops.secrets.thinkpad_priv_key = {};
  networking.wg-quick.interfaces.wg0 = {
    autostart = true;
    privateKeyFile = config.sops.secrets.thinkpad_priv_key.path;
    ips = ["10.100.0.1/24"];
    peers = [
      # For a client configuration, one peer entry for the server will suffice.

      {
        # Public key of the server (not a file path).
        publicKey = "WIBkjiHFyhZ8Hazn6tyEcIurzZHrf3LUs/Idx2k5T1M=";

        # Forward all the traffic via VPN.
        allowedIPs = ["0.0.0.0/0"];
        # Or forward only particular subnets
        #allowedIPs = [ "10.100.0.1" "91.108.12.0/22" ];

        # Set this to the server IP and port.
        endpoint = "${config.sops.secrets.ip_address}:51820"; # ToDo: route to endpoint not automatically configured https://wiki.archlinux.org/index.php/WireGuard#Loop_routing https://discourse.nixos.org/t/solved-minimal-firewall-setup-for-wireguard-client/7577

        # Send keepalives every 25 seconds. Important to keep NAT tables alive.
        persistentKeepalive = 25;
      }
    ];
  };
}
