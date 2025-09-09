{ flake, pkgs, ... }:
let
  inherit (flake) inputs;
in
{
  imports = [ inputs.flatpaks.homeManagerModules.nix-flatpak ];

  services.flatpak = {
    packages = [
      "org.vinegarhq.Sober"
      "com.github.tchx84.Flatseal"
    ];
  };
}
