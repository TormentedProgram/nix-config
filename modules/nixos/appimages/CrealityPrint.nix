{ pkgs, ... }: let
  pname = "CrealityPrint";
  version = "6.2.2";

  src = pkgs.fetchurl {
    url = "https://github.com/CrealityOfficial/CrealityPrint/releases/download/v${version}/CrealityPrint_Ubuntu2404-V${version}.3203-x86_64-Release.AppImage";
    hash = "sha256:e53645779dcd591f83fd670cc152a22bc854aecdc065f9f6e3f0b93bf23cb37b";
  };
  
  appimageContents = pkgs.appimageTools.extract {
    inherit pname version src;
    postExtract = ''
      # Create lib directory if it doesn't exist
      mkdir -p $out/usr/lib

      # Create symlink bzip2 library
      ln -s ${pkgs.bzip2}/lib/libbz2.so.1 $out/usr/lib/libbz2.so.1.0
    '';
  };
in
    pkgs.appimageTools.wrapType2 {
      inherit pname version src;
      pkgs = pkgs;
      extraInstallCommands = ''
        install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
        substituteInPlace $out/share/applications/${pname}.desktop \
          --replace 'Exec=AppRun' 'Exec=${pname}'
        cp -r ${appimageContents}/usr/share/icons $out/share

        # unless linked, the binary is placed in $out/bin/appImageName-someVersion
        # ln -s $out/bin/${pname}-${version} $out/bin/${pname}
      '';

      extraBwrapArgs = [
        "--bind-try /etc/nixos/ /etc/nixos/"
      ];

      extraPkgs = pkgs: with pkgs; [
        bzip2
        autoPatchelfHook
        libdeflate
        asar
        # override doesn't preserve splicing https://github.com/NixOS/nixpkgs/issues/132651
        (buildPackages.wrapGAppsHook.override {inherit (buildPackages) makeWrapper;})
      ];
    }
