{
  pkgs,
  lib,
  config,
  ...
}: let
  settings = {
    pages = [
      {
        name = "Home";
        columns = [
          {
            size = "small";
            widgets = [
              {
                type = "calendar";
              }
              {
                type = "rss";
                limit = 10;
                collapse-after = 3;
                cache = "3h";
                feeds = [
                  {url = "https://ciechanow.ski/atom.xml";}
                  {
                    url = "https://www.joshwcomeau.com/rss.xml";
                    title = "Josh Comeau";
                  }
                  {url = "https://samwho.dev/rss.xml";}
                  {url = "https://awesomekling.github.io/feed.xml";}
                  {
                    url = "https://ishadeed.com/feed.xml";
                    title = "Ahmad Shadeed";
                  }
                ];
              }
            ];
          }
          {
            size = "full";
            widgets = [
              {type = "hacker-news";}
              {
                type = "videos";
                channels = [
                  "UCR-DXc1voovS8nhAvccRZhg" # Jeff Geerling
                  "UCv6J_jJa8GJqFwQNgNrMuww" # ServeTheHome
                  "UCOk-gHyjcWZNj3Br4oxwh0A" # Techno Tim
                ];
              }
              {
                type = "reddit";
                subreddit = "selfhosted";
              }
            ];
          }
          {
            size = "small";
            widgets = [
              {
                type = "weather";
                location = config.sops.secrets."location";
              }
            ];
          }
        ];
      }
    ];
  };

  settingsFormat = pkgs.formats.yaml {};
in {
  sops.secrets.location = {};
  virtualisation.oci-containers.containers."glance" = {
    image = "glanceapp/glance";
    ports = ["8080:8080"];
    volumes = [
      "${settingsFormat.generate "glance.yaml" settings}:/app/glance.yml"
      #"/etc/timezone:/etc/timezone:ro"
      #"/etc/localtime:/etc/localtime:ro"
    ];
    autoStart = true;
  };
}
