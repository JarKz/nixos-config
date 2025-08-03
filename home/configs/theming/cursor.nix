{ pkgs, ... }:
{
  home.pointerCursor = {
    enable = true;
    dotIcons.enable = true;

    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;

    x11 = {
      enable = true;
    };

    gtk = {
      enable = true;
    };
  };
}
