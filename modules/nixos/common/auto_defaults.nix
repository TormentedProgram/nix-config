{ pkgs, ... }:
let
  defaults = import ../../defaultApps.nix;
in
{
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "text/html" = "${defaults.browser}.desktop";
      "x-scheme-handler/http" = "${defaults.browser}.desktop";
      "x-scheme-handler/https" = "${defaults.browser}.desktop";
      "x-scheme-handler/about" = "${defaults.browser}.desktop";
      "x-scheme-handler/unknown" = "${defaults.browser}.desktop";
    };
  };

  environment.variables = {
    EDITOR = "nano";
    TERMINAL = "${defaults.terminal}";
    DEFAULT_BROWSER = "${defaults.browser}";
  };
}
