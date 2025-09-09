{ lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "steam"
      "steam-unwrapped"
      "chapterskip"
      "evafast" 
      "rust-rover"
    ];
}
