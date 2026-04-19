{
  config,
  pkgs,
  machineSpecs,
  ...
}:
let
  obs-plugins = with pkgs.obs-studio-plugins; [
    obs-vaapi
    obs-vkcapture
  ];
  base-obs =
    if machineSpecs.is-not-nixos then config.lib.nixGL.wrap pkgs.obs-studio else pkgs.obs-studio;

in
{
  programs.obs-studio = {
    enable = true;
    package = base-obs;
    plugins = obs-plugins;
  };
}
