{
  config,
  pkgs,
  machineSpecs,
  ...
}:
{
  programs.hyprlock = {
    enable = true;
    package = if machineSpecs.is-not-nixos then config.lib.nixGL.wrap pkgs.hyprlock else pkgs.hyprlock;

    extraConfig = builtins.readFile ./hyprlock.conf;
  };
}
