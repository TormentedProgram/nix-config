{ flake, pkgs, ... }:
let
  inherit (flake) inputs;
in
{
  # Nix packages to install to $HOME
  #
  # Search for packages here: https://search.nixos.org/packages
  home.packages = with pkgs; [];

  # Programs natively supported by home-manager.
  # They can be configured in `programs.*` instead of using home.packages.
  programs = {
    librewolf = {
      enable = true;
      profiles.default = {
        extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
          ublock-origin
          sponsorblock
          return-youtube-dislikes
          traduzir-paginas-web # Translate Web Pages
          darkreader
          violentmonkey
          user-agent-string-switcher
          re-enable-right-click
        ];
        id = 0;
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

          "extensions.autoDisableScopes" = 0;

          "browser.uidensity" = 1;
          "browser.search.openintab" = true;
          "xpinstall.signatures.required" = false;
          "extensions.update.enabled" = false;

          "browser.display.use_document_fonts" = true;
          "media.videocontrols.picture-in-picture.enabled" = true;

          "widget.non-native-theme.enabled" = false;

          "browser.newtabpage.enabled" = false;
          "browser.startup.homepage" = "about:blank";

          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "browser.ping-centre.telemetry" = false;
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.hybridContent.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.reportingpolicy.firstRun" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.updatePing.enabled" = false;

          "experiments.activeExperiment" = false;
          "experiments.enabled" = false;
          "experiments.supported" = false;
          "network.allow-experiments" = false;

          "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
        };
      };
    };
  };

  # Services natively supported by home-manager.
  # They can be configured in `services.*` instead of using home.packages.
  services = {};
}
