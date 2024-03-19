{ pkgs, lib, config, ... }:
{
  services.invidious = {
    enable = true;
    domain = "yt.theholytachanka.com";
    settings = {
      popular_enabled = true;
      statistics_enabled = true;
      registration_enabled = false;
      login_enabled = false;
      banner = "If you like what i do consider donating:";
      db.user = "invidious";
      db.dbname = "invidious";
    };
  };

}
