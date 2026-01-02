{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      corefonts
      arkpandora_ttf
      wqy_zenhei
      wqy_microhei
      liberation-sans-narrow
      liberation_ttf_v1
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      ubuntu-sans
      vazir-fonts
      dejavu_fonts
      nerd-fonts.arimo
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
    ];

    enableDefaultPackages = true;
    enableGhostscriptFonts = true;
    fontconfig.enable = true;

    fontconfig = {
      defaultFonts = {
      serif = [ "Liberation Serif" "Vazirmatn" ];
      sansSerif = [ "Ubuntu" "Vazirmatn" ];
      monospace = [ "Ubuntu Mono" ];
      };
    };
  };
}
