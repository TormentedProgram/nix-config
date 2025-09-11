{ pkgs, ... }:
let
  defaults = import ../../defaultApps.nix;
  default_browser = defaults.browser;
in
{
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "text/html" = "${default_browser}.desktop";
      "x-scheme-handler/http" = "${default_browser}.desktop";
      "x-scheme-handler/https" = "${default_browser}.desktop";
      "x-scheme-handler/about" = "${default_browser}.desktop";
      "x-scheme-handler/unknown" = "${default_browser}.desktop";
    };
  };
}
