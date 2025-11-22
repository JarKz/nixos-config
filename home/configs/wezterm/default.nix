{
  config,
  pkgs,
  tools,
  machineSpecs,
  ...
}:
let
  weztermModules = tools.importConfig.import ./modules "wezterm";
in
{
  programs.wezterm = {
    enable = true;
    package = if machineSpecs.is-not-nixos then config.lib.nixGL.wrap pkgs.wezterm else pkgs.wezterm;

    enableBashIntegration = true;
    enableZshIntegration = true;

    extraConfig = builtins.readFile ./wezterm.lua;
  };

  xdg.configFile = weztermModules;
}
