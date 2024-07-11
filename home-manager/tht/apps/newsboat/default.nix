{config, ...}: {
  sops.secrets.vpn_pass = {};
  programs.newsboat = {
    enable = true;
    extraConfig = ''
      urls-source "freshrss"
      freshrss-url "https://rss.zdx.fr/api/greader.php"
      freshrss-login "tht"
      freshrss-passwordfile ${config.secrets.vpn_pass.path}
    '';
  };
}
