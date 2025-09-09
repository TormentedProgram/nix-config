{ config, pkgs, ... }:
{
  nix.settings = {
      download-buffer-size = 268435456; # 256MB buffer to avoid "buffer full" warnings
  };
}
