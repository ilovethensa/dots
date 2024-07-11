{inputs, config, ...}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];
  sops.secrets.vpn_pass = {};
  programs.newsboat = {
    enable = true;
    extraConfig = ''
      urls-source "freshrss"
      freshrss-url "https://rss.zdx.fr/api/greader.php"
      freshrss-login "tht"
      freshrss-passwordfile ${config.sops.secrets.vpn_pass.path}
    '';
  };
}
