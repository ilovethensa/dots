{
  pkgs,
  lib,
  inputs,
  ...
}: {
  home.file.".mozilla/firefox/default/chrome/firefox-gnome-theme".source =
    inputs.firefox-gnome-theme;
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "Default";
      isDefault = true;
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        darkreader
        ublock-origin
        libredirect
        sponsorblock
        istilldontcareaboutcookies
        dearrow
        violentmonkey
        boring-rss
        bitwarden
        augmented-steam
        enhanced-github
      ];
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.uidensity" = 0;
        "svg.context-properties.content.enabled" = true;
        "browser.theme.dark-private-windows" = false;
        "widget.gtk.rounded-bottom-corners.enabled" = true;
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";

        "gfx.canvas.accelerated.cache-items" = 4096;
        "gfx.canvas.accelerated.cache-size" = 512;
        "gfx.content.skia-font-cache-size" = 20;
        "browser.cache.jsbc_compression_level" = 3;
        "media.memory_cache_max_size" = 65536;
        "media.cache_readahead_limit" = 7200;
        "media.cache_resume_threshold" = 3600;
        "image.mem.decode_bytes_at_a_time" = 32768;
        "network.buffer.cache.size" = 262144;
        "network.buffer.cache.count" = 128;
        "network.http.max-connections" = 1800;
        "network.http.max-persistent-connections-per-server" = 10;
        "network.http.max-urgent-start-excessive-connections-per-host" = 5;
        "network.http.pacing.requests.enabled" = false;
        "network.dnsCacheExpiration" = 3600;
        "network.dns.max_high_priority_threads" = 8;
        "network.ssl_tokens_cache_capacity" = 10240;
        "network.dns.disablePrefetch" = true;
        "network.prefetch-next" = false;
        "network.predictor.enabled" = false;
        "layout.css.grid-template-masonry-value.enabled" = true;
        "dom.enable_web_task_scheduling" = true;
        "layout.css.has-selector.enabled" = true;
        "dom.security.sanitizer.enabled" = true;
        "browser.contentblocking.category" = "strict";
        "urlclassifier.trackingSkipURLs" = "*.reddit.com, *.twitter.com, *.twimg.com, *.tiktok.com";
        "urlclassifier.features.socialtracking.skipURLs" = "*.instagram.com, *.twitter.com, *.twimg.com";
        "network.cookie.sameSite.noneRequiresSecure" = true;
        "browser.download.start_downloads_in_tmp_dir" = true;
        "browser.helperApps.deleteTempFileOnExit" = true;
        "browser.uitour.enabled" = false;
        "privacy.globalprivacycontrol.enabled" = true;
        "privacy.globalprivacycontrol.functionality.enabled" = true;
        "security.OCSP.enabled" = 0;
        "security.remote_settings.crlite_filters.enabled" = true;
        "security.pki.crlite_mode" = 2;
        "security.ssl.treat_unsafe_negotiation_as_broken" = true;
        "browser.xul.error_pages.expert_bad_cert" = true;
        "security.tls.enable_0rtt_data" = false;
        "browser.privatebrowsing.forceMediaMemoryCache" = true;
        "browser.sessionstore.interval" = 60000;
        "privacy.history.custom" = true;
        "browser.search.separatePrivateDefault.ui.enabled" = true;
        "browser.urlbar.update2.engineAliasRefresh" = true;
        "browser.search.suggest.enabled" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.formfill.enable" = false;
        "security.insecure_connection_text.enabled" = true;
        "security.insecure_connection_text.pbmode.enabled" = true;
        "network.IDN_show_punycode" = true;
        "dom.security.https_first" = true;
        "signon.rememberSignons" = false;
        "signon.formlessCapture.enabled" = false;
        "signon.privateBrowsingCapture.enabled" = false;
        "network.auth.subresource-http-auth-allow" = 1;
        "editor.truncate_user_pastes" = false;
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;
        "security.mixed_content.block_display_content" = true;
        "security.mixed_content.upgrade_display_content" = true;
        "security.mixed_content.upgrade_display_content.image" = true;
        "pdfjs.enableScripting" = false;
        "extensions.postDownloadThirdPartyPrompt" = false;
        "network.http.referer.XOriginTrimmingPolicy" = 2;
        "privacy.userContext.ui.enabled" = true;
        "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
        "media.peerconnection.ice.default_address_only" = true;
        "browser.safebrowsing.downloads.remote.enabled" = false;
        "permissions.default.desktop-notification" = 2;
        "permissions.default.geo" = 2;
        "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
        "permissions.manager.defaultsUrl" = "";
        "webchannel.allowObject.urlWhitelist" = "";
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.server" = "data:,";
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;
        "toolkit.coverage.opt-out" = true;
        "toolkit.coverage.endpoint.base" = "";
        "browser.ping-centre.telemetry" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "app.shield.optoutstudies.enabled" = false;
        "app.normandy.enabled" = false;
        "app.normandy.api_url" = "";
        "breakpad.reportURL" = "";
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
        "captivedetect.canonicalURL" = "";
        "network.captive-portal-service.enabled" = false;
        "network.connectivity-service.enabled" = false;
        "browser.privatebrowsing.vpnpromourl" = "";
        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "browser.discovery.enabled" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" =
          false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" =
          false;
        "browser.preferences.moreFromMozilla" = false;
        "browser.tabs.tabmanager.enabled" = false;
        "browser.aboutConfig.showWarning" = false;
        "browser.aboutwelcome.enabled" = false;
        "browser.compactmode.show" = true;
        "browser.display.focus_ring_on_anything" = true;
        "browser.display.focus_ring_style" = 0;
        "browser.display.focus_ring_width" = 0;
        "layout.css.prefers-color-scheme.content-override" = 2;
        "browser.privateWindowSeparation.enabled" = false;
        "cookiebanners.service.mode" = 1;
        "cookiebanners.service.mode.privateBrowsing" = 1;
        "cookiebanners.service.enableGlobalRules" = true;
        "full-screen-api.transition-duration.enter" = "0 0";
        "full-screen-api.transition-duration.leave" = "0 0";
        "full-screen-api.warning.delay" = -1;
        "full-screen-api.warning.timeout" = 0;
        "browser.urlbar.suggest.calculator" = true;
        "browser.urlbar.unitConversion.enabled" = true;
        "browser.urlbar.trending.featureGate" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "extensions.pocket.enabled" = false;
        "browser.download.useDownloadDir" = false;
        "browser.download.always_ask_before_handling_new_types" = true;
        "browser.download.manager.addToRecentDocs" = false;
        "browser.download.open_pdf_attachments_inline" = true;
        "browser.bookmarks.openInTabClosesMenu" = false;
        "browser.menu.showViewImageInfo" = true;
        "findbar.highlightAll" = true;
        "layout.word_select.eat_space_to_next_word" = false;
        "ui.key.menuAccessKeyFocuses" = false;
      };
      userChrome = ''
        @import "firefox-gnome-theme/userChrome.css";
      '';
      userContent = ''
        @import "firefox-gnome-theme/userContent.css";
      '';
      search = {
        default = "Brave";
        privateDefault = "Brave";
        force = true;
        order = ["Brave" "NixOS Wiki" "Nix Packages"];
        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["np"];
          };

          "NixOS Wiki" = {
            urls = [
              {
                template = "https://nixos.wiki/index.php?search={searchTerms}";
              }
            ];
            iconUpdateURL = "https://nixos.wiki/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = ["nw"];
          };
          "Brave" = {
            urls = [
              {
                template = "https://search.brave.com/search?q={searchTerms}";
              }
            ];
            iconUpdateURL = "https://brave.com/static-assets/images/brave-logo-sans-text.svg";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = ["br"];
          };
          "Bing".metaData.hidden = true;
          "Google".metaData.hidden = true;
          "Amazon".metaData.hidden = true;
        };
      };
    };
  };
}
