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
      rust-analyzer
      pyright ruff
      typst-lsp
    ];
  };

  xdg.configFile."nvim" = {
    source = ./nvim;
    executable = true;
    recursive = true;
  };
}
