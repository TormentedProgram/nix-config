{ pkgs, ... }:
let
  defaults = import ../../defaultApps.nix;
in
{
  xdg.mime = {
    enable = true;
    defaultApplications = {
      # BROWSER
      "text/html" = "${defaults.browser}.desktop";
      "x-scheme-handler/http" = "${defaults.browser}.desktop";
      "x-scheme-handler/https" = "${defaults.browser}.desktop";
      "x-scheme-handler/about" = "${defaults.browser}.desktop";
      "x-scheme-handler/unknown" = "${defaults.browser}.desktop";

      # IMAGES
      "image/png" = "${defaults.imageViewer}.desktop";
      "image/jpeg" = "${defaults.imageViewer}.desktop";
      "image/webp" = "${defaults.imageViewer}.desktop";

      # VIDEO
      "video/mp4" = "${defaults.videoPlayer}.desktop";
      "video/webm" = "${defaults.videoPlayer}.desktop";
      "video/x-matroska" = "${defaults.videoPlayer}.desktop";
      "video/quicktime" = "${defaults.videoPlayer}.desktop"; 

      # AUDIO
      "audio/mpeg" = "${defaults.videoPlayer}.desktop"; # please don't make me do all the mimetypes for mp3s
      "audio/wav" = "${defaults.videoPlayer}.desktop";
      "audio/flac" = "${defaults.videoPlayer}.desktop";
    };
  };

  environment.variables = {
    EDITOR = "nano";
    TERMINAL = "${defaults.terminal}";
    DEFAULT_BROWSER = "${defaults.browser}";
  };
}
