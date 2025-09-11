{ pkgs, ... }:
let
  default_browser = "librewolf"; # WARNING somehow set this from a defaultApps.nix file or something cool like that
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
