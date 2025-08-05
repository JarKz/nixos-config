{ pkgs, flake-pkgs, machineSpecs, tools, ... }:
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

    mainOutput = ''
      output "${machineSpecs.outputs.main.name}" {
        mode "${machineSpecs.outputs.main.width}x${machineSpecs.outputs.main.height}@${machineSpecs.outputs.main.framerate}"
        variable-refresh-rate
        focus-at-startup
        scale ${machineSpecs.outputs.main.scale}
        transform "${machineSpecs.outputs.main.transform}"
        position x=${machineSpecs.outputs.main.offset.x} y=${machineSpecs.outputs.main.offset.y}
      }
    '';

    secondaryOutput = ''
      output "${machineSpecs.outputs.secondary.name}" {
        mode "${machineSpecs.outputs.secondary.width}x${machineSpecs.outputs.secondary.height}@${machineSpecs.outputs.secondary.framerate}"
        scale ${machineSpecs.outputs.secondary.scale}
        transform "${machineSpecs.outputs.secondary.transform}"
        position x=${machineSpecs.outputs.secondary.offset.x} y=${machineSpecs.outputs.secondary.offset.y}
      }
    '';
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
