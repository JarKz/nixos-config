{ tools, ... }:
let
  weztermModules = tools.importConfig.import ./modules "wezterm";
in
{
  programs.wezterm = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;

    extraConfig = builtins.readFile ./wezterm.lua;
  };

  xdg.configFile = weztermModules;
}
