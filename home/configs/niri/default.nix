{ pkgs, flake-pkgs, tools, ... }:
let
  vocabulary = {
    brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
    wlr-which-key = "${pkgs.wlr-which-key}/bin/wlr-which-key";
    wl-paste = "${pkgs.wl-clipboard}/bin/wl-paste";
    satty = "${pkgs.satty}/bin/satty";
    wofi = "${pkgs.wofi}/bin/wofi";
    hyprlock = "${pkgs.hyprlock}/bin/hyprlock";
    playerctl = "${pkgs.playerctl}/bin/playerctl";
    lc-niri = "${flake-pkgs.lc-niri.default}/bin/lc-niri";
  };
in
{
  home.packages = [
    pkgs.brightnessctl
    pkgs.wlr-which-key
    pkgs.satty
    pkgs.wl-clipboard
    pkgs.playerctl
    flake-pkgs.lc-niri.default
  ];

  xdg.configFile."niri/config.kdl".text = tools.templateConfig ./config.kdl vocabulary;
}
