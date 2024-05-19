{...}: {
  services.grafana = {
    enable = true;
    dataDir = "/srv/data/grafana";
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
