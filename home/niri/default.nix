{ pkgs, ... }:
let
  templateConfig = import ../../tools/template-config.nix;
  vocabulary = {
    "brightnessctl" = "${pkgs.brightnessctl}/bin/brightnessctl";
    "wlr-which-key" = "${pkgs.wlr-which-key}/bin/wlr-which-key";
    "wl-paste" = "${pkgs.wl-clipboard}/bin/wl-paste";
    "satty" = "${pkgs.satty}/bin/satty";
    "wofi" = "${pkgs.wofi}/bin/wofi";
    "hyprlock" = "${pkgs.hyprlock}/bin/hyprlock";
  };
in
{
  # Missing packages:
  #  - lc-niri;
  home.packages = with pkgs; [
    brightnessctl
    wlr-which-key
    satty
    wl-clipboard
  ];

  xdg.configFile."niri/config.kdl".text = templateConfig ./config.kdl vocabulary;
}
