{
  pkgs,
  secrets,
  ...
}: {
  services.homepage-dashboard = {
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
  };
}
