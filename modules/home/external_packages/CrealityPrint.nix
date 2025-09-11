{ pkgs, ... }:

let
  pname = "creality-print";
  version = "v6.2.2";

  src = pkgs.fetchurl {
    url = "https://github.com/CrealityOfficial/CrealityPrint/releases/download/${version}/CrealityPrint_Ubuntu2004-${version}.3203-x86_64-Release.AppImage";
    hash = "sha256:d683c561e94a9fa6296e489235e8311bed44b3b9d0b42ecd1e311fe22109f3fe";
  };

  appimageContents = pkgs.appimageTools.extract {
    inherit pname version src;
  };

  crealityprint = pkgs.appimageTools.wrapType2 {
    inherit pname version src;
    pkgs = pkgs;
    extraBwrapArgs = [ "--bind-try /etc/nixos/ /etc/nixos/" ];
    extraPkgs = pkgs_: with pkgs_; [
      libsoup_2_4
      webkitgtk_4_0
      libdeflate

      autoPatchelfHook
      (buildPackages.wrapGAppsHook.override { inherit (buildPackages) makeWrapper; })
    ];
  };
in
{
  home.packages = with pkgs; [ creality-print ];
  home.file.".local/share/applications/creality-print.desktop".text = ''
    [Desktop Entry]
    Name=CrealityPrint
    GenericName=3D Printing Software from Nix-Appimage
    Icon=CrealityPrint
    Terminal=false
    Exec=creality-print
    Type=Application
    MimeType=model/stl;application/vnd.ms-3mfdocument;application/prs.wavefront-obj;application/x-amf;
    Categories=Graphics;3DGraphics;Engineering;Utility
    StartupNotify=false
  '';
}
