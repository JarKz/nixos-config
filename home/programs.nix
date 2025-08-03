{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.filelight
    kdePackages.dolphin

    telegram-desktop

    trash-cli
  ];
}
