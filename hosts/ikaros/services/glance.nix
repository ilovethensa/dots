{pkgs, ...}: let
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
                  "UCgdTVe88YVSrOZ9qKumhULQ" # Hardware heaven
                  "UC6mIxFTvXkWQVEHPsEdflzQ" # GreatScott!
                ];
              }
              {
                type = "reddit";
                subreddit = "selfhosted";
              }
            ];
          }
          {
            size = "small";
            widgets = [
              {
                type = "stocks";
                stocks = [
                  {
                    symbol = "AAPL";
                    name = "Apple";
                  }
                  {
                    symbol = "TSLA";
                    name = "Tesla";
                  }
                  {
                    symbol = "MSFT";
                    name = "Microsoft";
                  }
                ];
              }
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
    image = "glanceapp/glance:v0.7.4-amd64";
    ports = ["8080:8080"];
    volumes = [
      "${settingsFormat.generate "glance.yaml" settings}:/app/glance.yml"
      #"/etc/timezone:/etc/timezone:ro"
      #"/etc/localtime:/etc/localtime:ro"
    ];
    autoStart = true;
  };
  networking.firewall.allowedTCPPorts = [
    8080 # UI
  ];
}
