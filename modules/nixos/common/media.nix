{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ffmpeg
    imagemagick
  ];

  services = {
    navidrome = {
      enable = true;
    };
  };
}
