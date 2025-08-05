{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.filelight
    kdePackages.dolphin

    yandex-music
    pavucontrol
    blueman
    fim

    discord
    telegram-desktop

    # Temporary for checking the stability of usage
    materialgram

    trash-cli
  ];

  programs = {
    mpv.enable = true;
    ghostty.enable = true;
    element-desktop.enable = true;
  };
}
