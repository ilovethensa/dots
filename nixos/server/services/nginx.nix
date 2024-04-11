{ pkgs, lib, config, ... }:
{
  services.nginx = {
    enable = true;
    #recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    #recommendedTlsSettings = true;

    virtualHosts."jellyfin.local" = {
      locations."/" = {
        proxyPass = "http://localhost:8096";
      };
    };
  };
}
