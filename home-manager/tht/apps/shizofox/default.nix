{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.schizofox.homeManagerModule
  ];
  programs.schizofox = {
    enable = true;

    theme = {
      colors = {
        background-darker = "181825";
        background = "1e1e2e";
        foreground = "cdd6f4";
      };

      font = "Lexend";

      extraUserChrome = ''
        body {
          color: red !important;
        }
      '';
    };

    search = {
      defaultSearchEngine = "Brave";
      removeEngines = ["Google" "Bing" "Amazon.com" "eBay" "Twitter" "Wikipedia"];
      searxUrl = "https://searx.be";
      searxQuery = "https://searx.be/search?q={searchTerms}&categories=general";
      addEngines = [
        {
          Name = "Nixos wiki";
          Description = "Search the wiki";
          Alias = "nw";
          Method = "GET";
          URLTemplate = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
        }
        {
          Name = "Nixos packages";
          Description = "Search the repo";
          Alias = "np";
          Method = "GET";
          URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
        }
      ];
    };

    security = {
      sanitizeOnShutdown = false;
      sandbox = true;
      userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:106.0) Gecko/20100101 Firefox/106.0";
    };

    misc = {
      drmFix = true;
      disableWebgl = false;
      #startPageURL = "file://${builtins.readFile ./startpage.html}";
    };

    extensions = {
      simplefox.enable = true;
      darkreader.enable = true;

      extraExtensions = {
        "webextension@metamask.io".install_url = "https://addons.mozilla.org/firefox/downloads/latest/ether-metamask/latest.xpi";
      };
    };
  };
}
