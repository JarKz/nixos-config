{ pkgs, ... }:
{
  home.packages = with pkgs; [ satty ];

  xdg.configFile."satty/config.toml".text = builtins.readFile ./config.toml;
}
