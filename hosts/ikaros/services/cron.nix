{
  config,
  pkgs,
  ...
}: let
  check-space = pkgs.writeShellScriptBin "check-space.sh" ''
    USER_KEY="${config.sops.secrets.pushover_user}"
    API_TOKEN="${config.sops.secrets.pushover_key}"
    for dir in /nix /srv/nvme /srv/Media; do
      [ $(df "$dir" --output=pcent | tail -1 | tr -d ' %') -ge 90 ] && \
      ${pkgs.curl}/bin/curl -s -F "token=$API_TOKEN" -F "user=$USER_KEY" -F "message=Warning: $dir is full!" https://api.pushover.net/1/messages.json
    done
  '';
  restart-podman = pkgs.writeShellScriptBin "restart-podman.sh" ''
    systemctl list-units | grep -o 'podman-[a-zA-Z0-9\-]*.service' | sort | uniq | while read -r unit; do
      echo "Restarting $unit"
      systemctl restart "$unit"
    done
  '';
in {
  sops.secrets.pushover_user = {};
  sops.secrets.pushover_key = {};
  environment.systemPackages = [
    restart-podman
    check-space
  ];
  services.cron = {
    enable = true;
    systemCronJobs = [
      "0 * /4 * * * restart-podman.sh"
      "*/5 * * * * check-space.sh"
    ];
  };
}
