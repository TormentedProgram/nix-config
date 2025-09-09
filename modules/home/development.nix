{ pkgs, ... }:
{
  # hopefully this imports my appimages automagically
  imports = builtins.map (fn:
    import (../../appimages/${fn}) { inherit pkgs; }
  ) (builtins.attrNames (builtins.readDir ../../appimages/.));

  # Nix packages to install to $HOME
  #
  # Search for packages here: https://search.nixos.org/packages
  home.packages = with pkgs; [
    pkgs.just
    jetbrains.idea-community-bin
    jetbrains.rust-rover
    micromamba
    gittyup
    vscodium-fhs
    crealityprint
  ];

  # Programs natively supported by home-manager.
  # They can be configured in `programs.*` instead of using home.packages.
  programs = {};

  # Services natively supported by home-manager.
  # They can be configured in `services.*` instead of using home.packages.
  services = {};
}
