{...}: {
  services.grafana = {
    enable = true;
    dataDir = "/srv/data/grafana";
    settings = {
      server = {
        # Listening Address
        http_addr = "0.0.0.0";
        # and Port
        http_port = 3000;
        # Grafana needs to know on which domain and URL it's running
        domain = "192.168.1.111";
        #root_url = "https://your.domain/grafana/"; # Not needed if it is `https://your.domain/`
        #serve_from_sub_path = true;
      };
    };
  };
  services.prometheus.exporters.node.enable = true;

  services.prometheus = {
    enable = true;
    scrapeConfigs = [
      {
        job_name = "renegade";
        static_configs = [
          {targets = ["192.168.1.104:9100"];}
        ];
      }
      {
        job_name = "ikaros";
        static_configs = [
          {targets = ["127.0.0.1:9100"];}
        ];
      }
    ];
  };
}
