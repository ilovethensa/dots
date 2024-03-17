{ pkgs, lib, config, secrets, ... }:
{
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
      layout = {
        "Metrics" = {
          style = "row";
          columns = 4;
          header = false;
        };
        "Media" = {
          style = "row";
          columns = 2;
          header = false;
        };
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
        "Metrics" = [
          {
            "Network" = {
              widget = {
                type = "glances";
                url = "http://192.168.1.111:61208";
                metric = "network:eth0";
              };
            };

          }
          {
            "CPU" = {
              widget = {
                type = "glances";
                url = "http://192.168.1.111:61208";
                metric = "cpu";
              };
            };
          }
          {
            "Disk" = {
              widget = {
                type = "glances";
                url = "http://192.168.1.111:61208";
                metric = "disk:sda";
              };
            };
          }
          {
            "Memory" = {
              widget = {
                type = "glances";
                url = "http://192.168.1.111:61208";
                metric = "memory";
              };
            };
          }

        ];
      }
      {
        "Media" = [
          {
            "Jellyfin" = {
              href = "http://192.168.1.111:8096";
              icon = "jellyfin.png";
              description = "Homepage is awesome";
              widget = {
                type = "jellyfin";
                url = "http://192.168.1.111:8096";
                key = secrets.homepage.jellyfin_api_key;
                enableBlocks = true; # optional, defaults to false
                enableNowPlaying = true; # optional, defaults to true
              };
            };
          }
          {
            "Jellyseerr" = {
              href = "http://192.168.1.111:5055";
              icon = "jellyseerr.png";
              description = "Homepage is awesome";
              widget = {
                type = "jellyseerr";
                url = "http://192.168.1.111:5055";
                key = secrets.homepage.jellyseerr_api_key;
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
    widgets = [
      {
        resources = {
          label = "server"; # Insert hostname here
          url = "http://192.168.1.111:61208"; # Insert URL:PORT here
          cpu = true;
          disk = "/nix";
          expanded = true;
        };
      }
      {
        search = {
          provider = "duckduckgo";
          focus = true;
          target = "_blank";
        };
      }
      {
        datetime = {
          format = {
            dateStyle = "short";
            timeStyle = "short";
            hour12 = true;
          };
        };
      }
      {
        openmeteo = {
          label = ""; # Insert city name here
          latitude = ""; # Insert latitude here
          longitude = ""; # Insert longitude here
          units = "imperial";
          cache = 30; # Time in minutes to cache API responses, to stay within limits
        };
      }
    ];

    # https://gethomepage.dev/latest/configs/kubernetes/
    kubernetes = { };

    # https://gethomepage.dev/latest/configs/docker/
    docker = { };

    # https://gethomepage.dev/latest/configs/custom-css-js/
    customJS = "";
    customCSS = "";
  };
}
