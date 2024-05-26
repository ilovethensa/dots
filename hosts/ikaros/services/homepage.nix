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
          disk = "/";
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
  };
}
