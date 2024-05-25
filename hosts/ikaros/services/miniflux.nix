# ADMIN_USERNAME=my_admin_username
# ADMIN_PASSWORD=my_secure_password
{config, ...}: {
  sops.secrets.miniflux_user = {};
  sops.secrets.miniflux_pass = {};
  sops.templates."miniflux_env".content = ''
    ADMIN_USERNAME="${config.sops.placeholder.miniflux_user}"
    ADMIN_PASSWORD="${config.sops.placeholder.miniflux_pass}"
  '';
  services.miniflux = {
    enable = true;
    adminCredentialsFile = config.sops.templates."miniflux_env".path;
    createDatabaseLocally = true;
    config = {
      LISTEN_ADDR = "0.0.0.0:2653";
    };
  };
  networking.firewall.allowedTCPPorts = [
    2653
  ];
}
