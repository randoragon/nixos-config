{ pkgs, ... }: {
  programs.neovim = {
    enable = true;

    vimAlias = true;
    viAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;
    withPython3 = true;

    extraPackages = with pkgs; [
      tree-sitter
      unixtools.xxd

      # LSP servers and language-specific tools
      vscode-langservers-extracted  # HTML, CSS, JSON, Markdown, ESLint
      zls
      lua-language-server
      shellcheck
      nodePackages.bash-language-server
      rust-analyzer rustc
      pyright ruff
      typst-lsp
      texlab
    ];
  };

  home.sessionVariables = {
    NVIM_SMOOTHIE_ENABLED = "1";
    VIM_PREVIEW_HOME = "\${XDG_RUNTIME_DIR:-/run/user/$UID}/vim-preview";
  };

  xdg.configFile."nvim" = {
    source = ./nvim;
    executable = true;
    recursive = true;
  };
}
