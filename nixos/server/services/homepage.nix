{ pkgs, lib, config, ... }:
{
  services.homepage-dashboard = {

    # These options were already present in my configuration.

    enable = true;

    package = pkgs.homepage-dashboard;

    # The following options were what I planned to add.

    # https://gethomepage.dev/latest/configs/settings/
    settings = {
      title = "THT's homelab";
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
        "My First Group" = [
          {
            "My First Service" = {
              href = "http://localhost/";
              description = "Homepage is awesome";
            };
          }
        ];
      }
      {
        "My Second Group" = [
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
