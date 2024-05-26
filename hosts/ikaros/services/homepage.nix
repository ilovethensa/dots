{config, ...}: {
  sops.secrets.jellyfin_key = {};
  sops.secrets.jellyseerr_key = {};
  sops.secrets.prowlarr_key = {};
  sops.secrets.radarr_key = {};
  sops.secrets.sonarr_key = {};
  sops.secrets.bazarr_key = {};
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;
    settings = {
      title = "THT cloud";
      description = "A personal, hyper converged, self-hosted cloud.";

      background = {
        image = "https://cdnb.artstation.com/p/assets/images/images/065/778/947/large/alena-aenami-serenity-1k.jpg";
        opacity = 60;
      };

      cardBlur = "xl";
      theme = "dark";
      color = "slate";

      headerStyle = "clean";

      layout = {
        Graphs = {
          header = false;
          style = "row";
          columns = 4;
        };
        Players = {
          header = false;
          style = "row";
          columns = 2;
        };
        Media = {
          header = false;
          style = "row";
          columns = 3;
        };
        Downloads = {
          header = false;
          style = "row";
          columns = 2;
        };
      };
    };

    widgets = [
      {
        resources = {
          cpu = true;
          disk = "/nix";
          memory = true;
        };
      }
      {
        search = {
          provider = "duckduckgo";
          target = "_blank";
        };
      }
    ];

    services = [
      {
        "Players" = [
          {
            "Jellyfin" = {
              description = "Watch movies and TV shows.";
              href = "http://192.168.1.111:8096";
              icon = "jellyfin.png";
              widget = {
                type = "jellyfin";
                url = "http://192.168.1.111:8096";
                key = config.sops.secrets.jellyfin_key;
              };
            };
          }
          {
            "Jellyseerr" = {
              description = "Request movies and TV shows.";
              href = "https://192.168.1.111:5055";
              icon = "jellyseerr.png";
              server = "192.168.1.111";
              container = "jellyseerr";
              widget = {
                type = "jellyseerr";
                url = "http://192.168.1.111:5055";
                key = config.sops.secrets.jellyseerr_key;
              };
            };
          }
        ];
      }
      {
        "Media" = [
          {
            "Radarr" = {
              description = "Request and manage movies.";
              href = "http://192.168.1.111:7878";
              icon = "radarr.png";
              widget = {
                type = "radarr";
                url = "http://192.168.1.111:7878";
                key = config.sops.secrets.radarr_key;
                fields = ["wanted" "movies"];
              };
            };
          }
          {
            "Sonarr" = {
              description = "Request and manage TV shows.";
              href = "http://192.168.1.111:8989";
              icon = "sonarr.png";
              widget = {
                type = "sonarr";
                url = "http://192.168.1.111:8989";
                key = config.sops.secrets.sonarr_key;
                fields = ["wanted" "series"];
              };
            };
          }
          {
            "Bazarr" = {
              description = "Subtitle downloader";
              href = "http://192.168.1.111:6767";
              icon = "bazarr.png";
              widget = {
                type = "bazarr";
                url = "http://192.168.1.111:6767";
                key = config.sops.secrets.bazarr_key;
              };
            };
          }
        ];
      }
      {
        "Downloads" = [
          {
            "Flood" = {
              description = "Iso downloader";
              href = "http://192.168.1.111:9091";
              icon = "flood.png";
              widget = {
                type = "flood";
                url = "http://172.16.1.10:9091";
                fields = ["download" "upload"];
              };
              refreshInterval = 1000;
            };
          }
          {
            "Prowlarr" = {
              description = "Tracker manager";
              href = "http://192.168.1.111:9696";
              icon = "prowlarr.png";
              widget = {
                type = "prowlarr";
                url = "http://192.168.1.111:9696";
                key = config.sops.secrets.prowlarr_key;
                fields = ["numberOfGrabs" "numberOfQueries"];
              };
            };
          }
        ];
      }
      {
        "Graphs" = [
          {
            "PVE" = {
              widget = {
                type = "glances";
                url = "http://192.168.1.111:61208";
                metric = "info";
                chart = false;
              };
            };
          }
          {
            "NAS" = {
              widget = {
                type = "glances";
                url = "http://192.168.1.111:61208";
                metric = "fs:/mnt/media";
                chart = false;
              };
            };
          }
          {
            "Internal" = {
              widget = {
                type = "glances";
                url = "http://192.168.1.111:61208";
                metric = "network:vmbr1";
                chart = false;
              };
            };
          }
          {
            "External" = {
              widget = {
                type = "glances";
                url = "http://192.168.1.111:61208";
                metric = "network:enp5s0";
                chart = false;
              };
            };
          }
        ];
      }
    ];
  };
}
