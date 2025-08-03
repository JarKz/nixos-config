{ pkgs, tools, ... }:
let
  vocabulary = {
    wlr-which-key = "${pkgs.wlr-which-key}/bin/wlr-which-key";
  };

  wkConfigurations = tools.importConfig.importTemplated vocabulary [
    ./config.yaml
    ./focus.yaml
    ./move-workspace.yaml
    ./move.yaml
    ./resize.yaml
  ] "wlr-which-key";
in
{
  home.packages = with pkgs; [
    wlr-which-key
  ];

  xdg.configFile = wkConfigurations;
}
