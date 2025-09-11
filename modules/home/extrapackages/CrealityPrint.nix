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
    postExtract = ''
      substituteInPlace $out/${pname}.desktop --replace 'Exec=AppRun' 'Exec=${pname}'
    '';
  };

  creality-print = pkgs.appimageTools.wrapType2 {
    inherit pname version src;
    pkgs = pkgs;

    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
      cp -r ${appimageContents}/usr/share/icons $out/share
    '';

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
}
