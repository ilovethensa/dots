{config, ...}: {
  sops.secrets.jellyfin_key = {};
  sops.secrets.jellyseerr_key = {};
  sops.secrets.prowlarr_key = {};
  sops.secrets.radarr_key = {};
  sops.secrets.sonarr_key = {};
  sops.secrets.bazarr_key = {};
  sops.templates."homepage_env".content = ''
    HOMEPAGE_VAR_JELLYFIN_KEY="${config.sops.placeholder.jellyfin_key}"
    HOMEPAGE_VAR_JELLYSEERR_KEY="${config.sops.placeholder.jellyseerr_key}"
    HOMEPAGE_VAR_PROWLARR_KEY="${config.sops.placeholder.prowlarr_key}"
    HOMEPAGE_VAR_RADARR_KEY="${config.sops.placeholder.radarr_key}"
    HOMEPAGE_VAR_SONARR_KEY="${config.sops.placeholder.sonarr_key}"
    HOMEPAGE_VAR_BAZARR_KEY="${config.sops.placeholder.bazarr_key}"
  '';
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;
    environmentFile = config.sops.templates."homepage_env".path;
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
        "Graphs" = [
          {
            "ENetwork" = {
              widget = {
                type = "glances";
                url = "http://192.168.1.111:61208";
                metric = "network:eth0";
                chart = false;
              };
            };
          }
          {
            "Data" = {
              widget = {
                type = "glances";
                url = "http://192.168.1.111:61208";
                metric = "fs:/mnt/data";
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
            "INFO" = {
              widget = {
                type = "glances";
                url = "http://192.168.1.111:61208";
                metric = "info";
                chart = false;
              };
            };
          }
        ];
      }
      /*
         {
        "Downloads" = [
          {
            "Prowlarr" = {
              description = "Tracker manager";
              href = "http://192.168.1.111:9696";
              icon = "prowlarr.png";
              widget = {
                type = "prowlarr";
                url = "http://192.168.1.111:9696";
                key = "{{HOMEPAGE_VAR_PROWLARR_KEY}}";
                fields = ["numberOfGrabs" "numberOfQueries"];
              };
            };
          }
          {
            "Transmission" = {
              description = "Iso downloader";
              href = "http://192.168.1.111:9091";
              icon = "transmission.png";
              widget = {
                type = "transmission";
                url = "http://192.168.1.111:9091";
                fields = ["download" "upload"];
              };
              refreshInterval = 1000;
            };
          }
        ];
      }
      */
      /*
         {
        "Media" = [
          {
            "Bazarr" = {
              description = "Subtitle downloader";
              href = "http://192.168.1.111:6767";
              icon = "bazarr.png";
              widget = {
                type = "bazarr";
                url = "http://192.168.1.111:6767";
                key = "{{HOMEPAGE_VAR_BAZARR_KEY}}";
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
                key = "{{HOMEPAGE_VAR_SONARR_KEY}}";
                fields = ["wanted" "series"];
              };
            };
          }
          {
            "Radarr" = {
              description = "Request and manage movies.";
              href = "http://192.168.1.111:7878";
              icon = "radarr.png";
              widget = {
                type = "radarr";
                url = "http://192.168.1.111:7878";
                key = "{{HOMEPAGE_VAR_RADARR_KEY}}";
                fields = ["wanted" "movies"];
              };
            };
          }
        ];
      }
      */
      {
        "Players" = [
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
                key = "{{HOMEPAGE_VAR_JELLYSEERR_KEY}}";
              };
            };
          }
          {
            "Jellyfin" = {
              description = "Watch movies and TV shows.";
              href = "http://192.168.1.111:8096";
              icon = "jellyfin.png";
              widget = {
                type = "jellyfin";
                url = "http://192.168.1.111:8096";
                key = "{{HOMEPAGE_VAR_JELLYFIN_KEY}}";
              };
            };
          }
        ];
      }
    ];
  };
}
