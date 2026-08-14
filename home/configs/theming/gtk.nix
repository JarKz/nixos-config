{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.nwg-look
  ];

  gtk = {
    enable = true;

    font = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono NFM Regular";
      size = 12;
    };

    theme = {
      package = pkgs.orchis-theme;
      name = "Orchis-Light";
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Light";
    };
  };

  gtk.gtk4.theme = config.gtk.theme;
}
