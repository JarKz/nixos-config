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

    pipewire # For screencast in OBS-Studio

    trash-cli
  ];

  programs = {
    obs-studio.enable = true;
    mpv.enable = true;
    ghostty.enable = true;
    element-desktop.enable = true;
  };
}
