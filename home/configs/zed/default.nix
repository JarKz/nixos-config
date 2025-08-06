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
      "rust-std"
      "clippy"
    ];
  };
in
{
  nixpkgs.overlays = [ overlays.rust-overlay.overlays.default ];

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

      lsp = {
        rust-analyzer = {
          binary = {
            path = "${rustToolchain}/bin/rust-analyzer";
            arguments = [ ];
          };
        };

        harper-ls = {
          binary = {
            path = "${pkgs.harper}/bin/harper-ls";
          };
        };

        typos-lsp = {
          binary = {
            path = "${pkgs.typos-lsp}/bin/harper-ls";
          };
        };
      };
    };

    userKeymaps = [
      {
        context = "Editor && vim_mode == normal";
        bindings = {
          "\\ f f" = "file_finder::Toggle";
          "\\ g l" = "project_search::SearchInNew";
          "Space c a" = "editor::ToggleCodeActions";
        };
      }
      {
        context = "Editor && vim_mode == visual";
        bindings = {
          "Ctrl+c" = "editor::Copy";
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
