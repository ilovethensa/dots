{ pkgs, lib, config, ... }:
{
  services.libreddit = {
    enable = true;
    port = 6969;
  };

}
