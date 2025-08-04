{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.filelight
    kdePackages.dolphin
    ghostty

    yandex-music
    pavucontrol
    blueman
    mpv
    fim

    ###TEMPORARY
    swww
    ###

    discord
    element-desktop
    telegram-desktop

    pipewire # For screencast in OBS-Studio
    obs-studio

    trash-cli
  ];
}
