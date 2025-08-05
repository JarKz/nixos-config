{ pkgs, lib, tools, overlays, ... }:
let
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

  ftpluginConfigs = tools.importConfig.importTemplated vocabulary ./ftplugin "nvim";
  nvimConfigs = tools.importConfig.importTemplated vocabulary ./lua "nvim";
  spellConfigs = tools.importConfig.importSourced ./spell "nvim";

  efmVocabulary = with pkgs; {
    cppcheck = "${cppcheck}/bin/cppcheck";
    vale = "${vale}/bin/vale";
    markdownlint = "${markdownlint-cli}/bin/markdownlint";
    jq = "${jq}/bin/jq";
    fixjson = "${fixjson}/bin/fixjson";
    shfmt = "${shfmt}/bin/shfmt";
    yamllint = "${yamllint}/bin/yamllint";
    prettier = "${prettier}/bin/prettier";
    stylelint = "${stylelint}/bin/stylelint";
    htmlbeautifier = "${rubyPackages.htmlbeautifier}/bin/htmlbeautifier";
    tidy = "${html-tidy}/bin/tidy";
    autopep8 = "${python313Packages.autopep8}/bin/autopep8";
    nixpkgs-fmt = "${nixpkgs-fmt}/bin/nixpkgs-fmt";
  };

  efmConfig = tools.importConfig.importTemplated efmVocabulary ./efm-langserver/config.yaml "efm-langserver";
in
{
  nixpkgs.overlays = [ overlays.rust-overlay.overlays.default ];

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
    translate-shell

    # DAP
    lldb

    # Language Servers
    llvmPackages_21.clang-tools # clangd
    efm-langserver
    nil # nil_ls
    pyright
    bash-language-server # bashls
    vscode-langservers-extracted # html, cssls, eslint, json, markdown
    lua-language-server # lua_ls

    # Linters
    cppcheck
    markdownlint-cli
    stylelint
    vale
    python313Packages.autopep8
    fixjson
    jq
    rubyPackages.htmlbeautifier
    html-tidy
    prettier
    shfmt
    yamllint
    nixpkgs-fmt
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

    efmConfig
  ];
}
