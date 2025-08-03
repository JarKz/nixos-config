{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.filelight
    kdePackages.dolphin

    pavucontrol
    blueman
    mpv
    fim

    discord
    element-desktop
    telegram-desktop

    pipewire # For screencast in OBS-Studio
    obs-studio

    trash-cli
  ];
}
