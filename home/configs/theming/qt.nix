{ pkgs, ... }:
{
  home.packages = with pkgs; [
    materia-kde-theme
    papirus-icon-theme
  ];

  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=MateriaLight
  '';

  xdg.configFile."qt6ct/qt5ct.conf".text = ''
    [Appearance]
    icon_theme=Papirus
    style=kvantum

    [Fonts]
    fixed="Symbols Nerd Font,12,-1,5,50,0,0,0,0,0,Regular"
    general="JetBrainsMono Nerd Font,12,-1,5,50,0,0,0,0,0,Regular"
  '';

  xdg.configFile."qt6ct/qt6ct.conf".text = ''
    [Appearance]
    icon_theme=Papirus
    style=kvantum

    [Fonts]
    general="JetBrainsMono NFM,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"
    fixed="Noto Sans,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"
  '';

  qt = {
    enable = true;
    platformTheme.name = "qtct";

    style = {
      name = "kvantum";
    };
  };
}
