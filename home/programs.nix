{
  config,
  pkgs,
  machineSpecs,
  ...
}:
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
    ghostty = {
      enable = true;
      package = if machineSpecs.is-laptop then config.lib.nixGL.wrap pkgs.ghostty else pkgs.ghostty;
    };
    element-desktop.enable = true;
  };
}
