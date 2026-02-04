{
  config,
  pkgs,
  flake-pkgs,
  machineSpecs,
  tools,
  ...
}:
let
  glWrap = pkg: if machineSpecs.is-not-nixos then config.lib.nixGL.wrap pkg else pkg;
  hyprlock = glWrap pkgs.hyprlock;
  satty = glWrap pkgs.satty;

  vocabulary = with pkgs; {
    sh = "${bash}/bin/sh";
    brightnessctl = "${brightnessctl}/bin/brightnessctl";
    wlr-which-key = "${wlr-which-key}/bin/wlr-which-key";
    wl-paste = "${wl-clipboard}/bin/wl-paste";
    satty = "${satty}/bin/satty";
    wofi = "${wofi}/bin/wofi";
    hyprlock = "${hyprlock}/bin/hyprlock";
    playerctl = "${playerctl}/bin/playerctl";
    lc-niri = "${flake-pkgs.lc-niri.default}/bin/lc-niri";

    layouts = machineSpecs.keyboard.layouts;
    variants = machineSpecs.keyboard.variants;
    options = machineSpecs.keyboard.options;

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

    mainOutputName = machineSpecs.outputs.main.name;
    secondaryOutputName = machineSpecs.outputs.secondary.name;
  };
in
{
  home.packages = with pkgs;[
    brightnessctl
    wlr-which-key
    satty
    wl-clipboard
    playerctl
    flake-pkgs.lc-niri.default
    xwayland-satellite
  ];

  xdg.configFile."niri/config.kdl".text = tools.templateConfig ./config.kdl vocabulary;
}
