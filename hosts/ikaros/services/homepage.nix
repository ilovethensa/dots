{
  pkgs,
  secrets,
  ...
}: {
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;
    settings = {
      title = "THT cloud";
      cardBlur = "sm";
      layout = {
        Media = {
          style = "row";
          columns = "4";
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
        "My First Group" = [
          {
            "My First Service" = {
              description = "Homepage is awesome";
              href = "http://localhost/";
            };
          }
        ];
      }
      {
        "My Second Group" = [
          {
            "My Second Service" = {
              description = "Homepage is the best";
              href = "http://localhost/";
            };
          }
        ];
      }
    ];
  };
}
