{
  pkgs,
  lib,
  config,
  ...
}: let
  settings = {
    pages = [
      {
        name = "Home";
        columns = [
          {
            size = "small";
            widgets = [
              {
                type = "calendar";
              }
              {
                type = "reddit";
                subreddit = "selfhosted";
              }
            ];
          }
          {
            size = "full";
            widgets = [
              {
                type = "videos";
                channels = [
                  "UCR-DXc1voovS8nhAvccRZhg" # Jeff Geerling
                  "UCv6J_jJa8GJqFwQNgNrMuww" # ServeTheHome
                  "UCOk-gHyjcWZNj3Br4oxwh0A" # Techno Tim
                ];
              }
            ];
          }
          {
            size = "small";
            widgets = [
              {type = "hacker-news";}
            ];
          }
        ];
      }
    ];
  };

  settingsFormat = pkgs.formats.yaml {};
in {
  sops.secrets.location = {};
  virtualisation.oci-containers.containers."glance" = {
    image = "glanceapp/glance";
    ports = ["8080:8080"];
    volumes = [
      "${settingsFormat.generate "glance.yaml" settings}:/app/glance.yml"
      #"/etc/timezone:/etc/timezone:ro"
      #"/etc/localtime:/etc/localtime:ro"
    ];
    autoStart = true;
  };
}
