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
        /*         "Media" = {
          header = false;
        };
        "Downloaders" = {
          header = false;
        }; */
      };
    };

    # https://gethomepage.dev/latest/configs/bookmarks/
    bookmarks = [ ];


    # https://gethomepage.dev/latest/configs/services/
    services = [
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
                enableNowPlaying = false; # optional, defaults to true
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
              };
            };
          }

        ];
      }
      {
        "Tools" = [
          {
            "Qbittorrent" = {
              href = "http://192.168.1.111:8080";
              icon = "qbittorrent.png";
              description = "Homepage is awesome";
              widget = {
                type = "qbittorrent";
                url = "http://192.168.1.111:8080";
                username = secrets.qbittorrent.username;
                password = secrets.qbittorrent.password;
              };
            };
          }
          {
            "Unmanic" = {
              href = "http://192.168.1.111:8888";
              icon = "unmanic.png";
              description = "Homepage is awesome";
              widget = {
                type = "unmanic";
                url = "http://192.168.1.111:8888";
              };
            };
          }
          {
            "Scrutiny" = {
              href = "http://192.168.1.111:8090";
              icon = "scrutiny.png";
              description = "Homepage is awesome";
              widget = {
                type = "scrutiny";
                url = "http://192.168.1.111:8090";
              };
            };
          }

        ];
      }
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
    ];


    # https://gethomepage.dev/latest/configs/service-widgets/
    widgets = [
      {
        resources = {
          url = "http://192.168.1.111:61208"; # Insert URL:PORT here
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
          label = "Plovdiv"; # Insert city name here
          latitude = "42.1319"; # Insert latitude here
          longitude = "24.76058"; # Insert longitude here
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
