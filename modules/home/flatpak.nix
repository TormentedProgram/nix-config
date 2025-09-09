{ flake-inputs, pkgs, ... }:
{
  imports = [ flake-inputs.flatpaks.homeManagerModules.nix-flatpak ];

  services.flatpak = {
    packages = [
      "org.vinegarhq.Sober"
    ];
  };
}
