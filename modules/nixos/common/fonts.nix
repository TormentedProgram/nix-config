{ pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;
    fontconfig.useEmbeddedBitmaps = true;
    packages = with pkgs; [
      ubuntu_font_family
      liberation_ttf
      noto-fonts
      fira-code
      noto-fonts-cjk-sans
      jetbrains-mono
      nerd-fonts.iosevka
      nerd-fonts.jetbrains-mono # unstable
      nerd-fonts.fira-code # unstable
      nerd-fonts.fantasque-sans-mono #unstable
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
    ];

    fontconfig = {
      defaultFonts = {
        serif = [  "Liberation Serif" "Noto Serif CJK JP" "Noto Serif CJK KR" "Noto Serif CJK SC" "Noto Serif CJK TC" "Noto Serif CJK HK" ];
        sansSerif = [ "Ubuntu"" Noto Sans CJK JP" "Noto Sans CJK KR" "Noto Sans CJK SC" "Noto Sans CJK TC" "Noto Sans CJK HK" ];
        monospace = [ "Ubuntu Mono" ];
      };
    };
  };
}
