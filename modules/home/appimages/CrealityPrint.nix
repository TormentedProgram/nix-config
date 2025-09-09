{ pkgs, ... }:

let
  pname = "CrealityPrint";
  version = "6.2.2";

  src = pkgs.fetchurl {
    url = "https://github.com/CrealityOfficial/CrealityPrint/releases/download/v${version}/CrealityPrint_Ubuntu2404-V${version}.3203-x86_64-Release.AppImage";
    hash = "sha256:e53645779dcd591f83fd670cc152a22bc854aecdc065f9f6e3f0b93bf23cb37b";
  };

  appimageContents = pkgs.appimageTools.extract {
    inherit pname version src;
    postExtract = ''
      # optional adjustments
    '';
  };

  crealityprint = pkgs.appimageTools.wrapType2 {
    inherit pname version src;
    pkgs = pkgs;
    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
      substituteInPlace $out/share/applications/${pname}.desktop --replace 'Exec=AppRun' "Exec=${pname}"
      cp -r ${appimageContents}/usr/share/icons $out/share
    '';
    extraBwrapArgs = [ "--bind-try /etc/nixos/ /etc/nixos/" ];
    extraPkgs = pkgs_: with pkgs_; [
      bzip2
      autoPatchelfHook
      libdeflate
      asar
      (buildPackages.wrapGAppsHook.override { inherit (buildPackages) makeWrapper; })
    ];
  };
in
{
  home.packages = with pkgs; [
    crealityprint
  ];
}
