{
  config,
  pkgs,
  machineSpecs,
  ...
}:
let
  satty = if machineSpecs.is-laptop then config.lib.nixGL.wrap pkgs.satty else pkgs.satty;
in
{
  home.packages = [ satty ];

  xdg.configFile."satty/config.toml".text = builtins.readFile ./config.toml;
}
