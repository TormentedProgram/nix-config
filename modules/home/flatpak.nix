{ pkgs, ... }:
{
  services.flatpak = {
    packages = [
      "org.vinegarhq.Sober"
    ];
  };
}
