{ pkgs, ... }:
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
      package = pkgs.materia-theme;
      name = "Materia-light";
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
  };
}
