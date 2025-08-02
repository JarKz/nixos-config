{ pkgs, lib, rust-overlay, ... }:
let
  importConfig = import ../../tools/import-config.nix;
  vocabulary = with pkgs; {
    clangd = "${llvmPackages_21.clang-tools}/bin/clangd";
    pyright-langserver = "${pyright}/bin/pyright-langserver";
    vscode-css-language-server = "${vscode-langservers-extracted}/bin/vscode-css-language-server";
    vscode-html-language-server = "${vscode-langservers-extracted}/bin/vscode-html-language-server";
    bash-language-server = "${bash-language-server}/bin/bash-language-server";
    rust_analyzer = "${rust-bin.stable.latest.default}/bin/rust_analyzer";
    nil = "${nil}/bin/nil";
    efm-langserver = "${efm-langserver}/bin/efm-langserver";

    lldb-dap = "${lldb}/bin/lldb-dap";

    rustc-nightly = "$HOME/.local/nightly-rust/bin/rustc";
    cargo-nightly = "$HOME/.local/nightly-rust/bin/cargo";
  };

  ftpluginConfigs = importConfig.importTemplated vocabulary ./ftplugin "nvim";
  nvimConfigs = importConfig.importTemplated vocabulary ./lua "nvim";
  spellConfigs = importConfig.importSourced ./spell "nvim";
in
{
  nixpkgs.overlays = [ rust-overlay.overlays.default ];

  # Only for cargo to build blink.cmp
  home.file.".local/nightly-rust".source = pkgs.rust-bin.nightly."2025-07-27".minimal;

  home.packages = with pkgs; [
    gcc
    zig
    tree-sitter

    # For rust_analyzer
    (rust-bin.stable.latest.default.override {
      extensions = [ "rust-analyzer" ];
    })

    # Utilities
    fzf
    ripgrep

    # DAP
    lldb

    # Language Servers
    llvmPackages_21.clang-tools # clangd
    efm-langserver
    nil # nil_ls
    pyright
    bash-language-server # bashls
    vscode-langservers-extracted # html, cssls, eslint, json, markdown
    stylelint-lsp
    lua-language-server # lua_ls

    # Linters
    vale
    python313Packages.autopep8
    fixjson
    jq
    rubyPackages_3_4.htmlbeautifier
    prettier
    shfmt
    yamllint
    nixfmt
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraLuaConfig = builtins.readFile ./init.lua;
    extraLuaPackages = luaPkgs: with luaPkgs; [
      luautf8
    ];
  };

  xdg.configFile = lib.mkMerge [
    ftpluginConfigs
    nvimConfigs
    spellConfigs
  ];
}
