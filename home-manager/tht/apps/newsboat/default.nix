{config, ...}: {
  sops.secrets.vpn_pass = {};
  sops.templates."newsboat.conf".content = ''
    urls-source "freshrss"
    freshrss-url "https://rss.zdx.fr/api/greader.php"
    freshrss-login "tht"
    freshrss-password ${config.sops.placeholder.vpn_pass}
  '';
  programs.newsboat = {
    enable = true;
    extraConfig = config.sops.templates."newsboat.conf".content;
  };
}
