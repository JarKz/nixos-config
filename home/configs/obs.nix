{
  config,
  pkgs,
  machineSpecs,
  ...
}:
{
  programs.obs-studio = {
    enable = true;
    package = if machineSpecs.is-not-nixos then config.lib.nixGL.wrap pkgs.obs-studio else pkgs.obs-studio;
  };
}
