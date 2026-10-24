{
  config,
  pkgs,
  machineSpecs,
  ...
}:
let
  enabled = machineSpecs.use-custom-services;
in
{
  programs.hyprlock = {
    enable = enabled;
    package = if machineSpecs.is-not-nixos then config.lib.nixGL.wrap pkgs.hyprlock else pkgs.hyprlock;

    extraConfig = builtins.readFile ./hyprlock.conf;
  };
}
