{ config, pkgs, ... }:
{
  nix.settings = {
      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org" # For common packages like starship
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];  
      download-buffer-size = 268435456; # 256MB buffer to avoid "buffer full" warnings
  };
}
