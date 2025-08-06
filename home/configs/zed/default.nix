{
  config,
  pkgs,
  machineSpecs,
  ...
}:
{
  programs.zed-editor = {
    enable = true;
    package = if machineSpecs.is-laptop then config.lib.nixGL.wrap pkgs.zed-editor else pkgs.zed-editor;

    userSettings = {
      telemetry = {
        metrics = false;
      };
      base_keymap = "JetBrains";
      vim_mode = true;
      ui_font_family = "JetBrainsMono NFM";
      ui_font_size = 20;
      ui_font_weight = 400;
      buffer_font_family = "JetBrainsMono NFM";
      buffer_font_size = 20;
      buffer_font_weight = 400;
    };
  };
}
