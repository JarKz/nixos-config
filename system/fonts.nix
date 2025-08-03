{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif

    font-awesome
    junicode
    symbola

    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    google-fonts
  ];
}
