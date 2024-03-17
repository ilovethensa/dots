{ pkgs, lib, config, ... }:
{
  sops.secrets."homepage/jellyfin_api_key" = { };
  services.homepage-dashboard = {

    # These options were already present in my configuration.

    enable = true;

    package = pkgs.homepage-dashboard;

    # The following options were what I planned to add.

    # https://gethomepage.dev/latest/configs/settings/
    settings = {
      title = "THT's homelab";
      cardBlur = "xl";
      theme = "dark";
      color = "slate";
      headerStyle = "clean";
      background = {
        image = "https://wallpaperaccess.com/full/1959374.jpg";
        opacity = "60";
      };
    };

    # https://gethomepage.dev/latest/configs/bookmarks/
    bookmarks = [
      {
        Developer = [
          { Github = [{ abbr = "GH"; href = "https://github.com/"; }]; }
        ];
      }
      {
        Entertainment = [
          { YouTube = [{ abbr = "YT"; href = "https://youtube.com/"; }]; }
        ];
      }
    ];


    # https://gethomepage.dev/latest/configs/services/
    services = [
      {
        "Media" = [
          {
            "Jellyfin" = {
              href = "http://192.168.1.111:8096";
              description = "Homepage is awesome";
              widget = {
                type = "jellyfin";
                url = "http://192.168.1.111:8096";
                key = (builtins.readFile /run/secrets/homepage/jellyfin_api_key);
                enableBlocks = true; # optional, defaults to false
                enableNowPlaying = true; # optional, defaults to true
              };
            };
          }
        ];
      }
      {
        "Tools" = [
          {
            "My Second Service" = {
              href = "http://localhost/";
              description = "Homepage is the best";
            };
          }
        ];
      }
    ];


    # https://gethomepage.dev/latest/configs/service-widgets/
    widgets = [ ];

    # https://gethomepage.dev/latest/configs/kubernetes/
    kubernetes = { };

    # https://gethomepage.dev/latest/configs/docker/
    docker = { };

    # https://gethomepage.dev/latest/configs/custom-css-js/
    customJS = "";
    customCSS = "";
  };
}
