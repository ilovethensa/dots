{
  pkgs,
  lib,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
    arkenfox = {
      enable = true;
      version = "103.0";
    };

    profiles.Default.arkenfox = {
      enable = true;
      "0000".enable = true;
      "0001" = {
        enable = true;
        "0101"."browser.shell.checkDefaultBrowser".value = true;
      };
      "0002" = {
        enable = true;
        "0204"."browser.search.region".enable = true;
      };
    };
  };
}
