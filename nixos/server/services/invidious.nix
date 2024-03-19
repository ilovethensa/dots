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
      banner = "If you like what i do consider donating: 82yWS8vfVRa2h916awgssZ5C7sDL1KDkv9PrqRbc8pEpfNdCFwu9CBsJVk5BbfJvg9h3eqtiNN7Zg2mWqXRqBUiRUQgzJum";
      db.user = "invidious";
      db.dbname = "invidious";
    };
  };

}
