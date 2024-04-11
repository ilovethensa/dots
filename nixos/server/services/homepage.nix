{ pkgs
, lib
, config
, secrets
, ...
}:
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
              description = "Watch Movies/Tv";
              widget = {
                type = "jellyfin";
                url = "http://192.168.1.111:8096";
                key = secrets.jellyfin.apikey;
                enableBlocks = true; # optional, defaults to false
                enableNowPlaying = false; # optional, defaults to true
              };
            };
          }
          {
            "Jellyseerr" = {
              href = "http://192.168.1.111:5055";
              icon = "jellyseerr.png";
              description = "Request Movies/Tv";
              widget = {
                type = "jellyseerr";
                url = "http://192.168.1.111:5055";
                key = secrets.jellyseerr.apikey;
              };
            };
          }

        ];
      }
      {
        "Tools" = [
          {
            "Transmission" = {
              href = "http://192.168.1.111:9091";
              icon = "transmission.png";
              description = "Download linux isos";
              widget = {
                type = "transmission";
                url = "http://192.168.1.111:9091";
                username = secrets.common.username;
                password = secrets.common.password;
              };
            };
          }
          {
            "Prowlarr" = {
              href = "http://192.168.1.111:9696";
              icon = "prowlarr.png";
              description = "Tracker manager";
              widget = {
                type = "prowlarr";
                url = "http://192.168.1.111:9696";
                key = secrets.prowlarr.apikey;
              };
            };
          }
          {
            "Scrutiny" = {
              href = "http://192.168.1.111:8090";
              icon = "scrutiny.png";
              description = "Disk monitor";
              widget = {
                type = "scrutiny";
                url = "http://192.168.1.111:8090";
              };
            };
          }

        ];
      }
      {
        "Arr" = [
          {
            "Sonarr" = {
              href = "http://192.168.1.111:8989";
              icon = "sonarr.png";
              description = "Tv downloader";
              widget = {
                type = "sonarr";
                url = "http://192.168.1.111:8989";
                key = secrets.sonarr.apikey;
              };
            };
          }
          {
            "Radarr" = {
              href = "http://192.168.1.111:7878";
              icon = "radarr.png";
              description = "Movie downloader";
              widget = {
                type = "radarr";
                url = "http://192.168.1.111:7878";
                key = secrets.radarr.apikey;
              };
            };
          }
          {
            "Bazarr" = {
              href = "http://192.168.1.111:6767";
              icon = "bazarr.png";
              description = "Subtitle manager";
              widget = {
                type = "bazarr";
                url = "http://192.168.1.111:6767";
                key = secrets.bazarr.apikey;
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
          disk = "/srv/Media";
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
  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [
      #"/etc/homepage-dashboard"
    ];
  };
  services.nginx.virtualHosts = {
    "dash.local" = {

      locations."/".proxyPass = "http://127.0.0.1:8082";
    };
  };

}
