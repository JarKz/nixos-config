{
  config,
  pkgs,
  overlays,
  machineSpecs,
  ...
}:
let
  rustToolchain = pkgs.rust-bin.stable.latest.default.override {
    extensions = [
      "rust-analyzer"
      "rust-src"
      "clippy"
    ];
  };
in
{
  nixpkgs.overlays = [ overlays.rust-overlay.overlays.default ];

  programs.zed-editor = {
    enable = true;
    package = if machineSpecs.is-laptop then config.lib.nixGL.wrap pkgs.zed-editor else pkgs.zed-editor;

    extensions = [
      "harper"
      "typos"
      "codebook"
    ];

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

    userKeymaps = [
      {
        context = "Editor && vim_mode == normal";
        bindings = {
          "\\ f f" = "file_finder::Toggle";
          "\\ g l" = "workspace::NewSearch";
          "\\ o" = "project_panel::ToggleFocus";
          "\\ r s" = "buffer_search::DeployReplace";
          "Space c a" = "editor::ToggleCodeActions";
          "Space r n" = "editor::Rename";
          "\\ d s" = "debugger::Start";
          "\\ d c" = "debugger::Continue";
          "\\ d b t" = "editor::ToggleBreakpoint";
        };
      }
      {
        context = "ProjectSearchBar > Editor";
        bindings = {
          "escape" = "pane::CloseActiveItem";
        };
      }
      {
        context = "DebugPanel";
        bindings = {
          "escape q" = "workspace::CloseActiveDock";
        };
      }
      {
        context = "Editor && vim_mode == visual";
        bindings = {
          "ctrl-c" = "editor::Copy";
          "shift-j" = "editor::MoveLineDown";
          "shift-k" = "editor::MoveLineUp";
        };
      }
      {
        context = "ProjectPanel && not_editing";
        bindings = {
          "a f" = "project_panel::NewFile";
          "a d" = "project_panel::NewDirectory";
          "v" = "vim::ToggleVisual";
          "ctrl-d" = "project_panel::Trash";
          "enter" = "project_panel::OpenPermanent";
          "escape" = "workspace::CloseActiveDock";
        };
      }
    ];

    extraPackages = with pkgs; [
      harper
      typos-lsp
      rustToolchain
    ];
  };
}
