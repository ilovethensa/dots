{ pkgs, lib, config, ... }:
{
  services.libreddit = {
    enable = true;
    port = 6969;
  };
  services.nginx.virtualHosts = {
    "libreddit.local" = {
      default = true;
      locations."/".proxyPass = "http://127.0.0.1:14333";
    };
  };

}
