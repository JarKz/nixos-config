{ ... }:
{
  programs.zed-editor = {
    enable = true;

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
