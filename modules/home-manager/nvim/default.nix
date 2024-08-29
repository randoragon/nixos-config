{ pkgs, config, lib, ... }: {
  programs.neovim = {
    enable = true;

    vimAlias = true;
    viAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;
    withPython3 = true;

    extraPackages = with pkgs; [
      git
      tree-sitter
      unixtools.xxd
      gcc ripgrep fd  # Needed by the Telescope plugin

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

  # Install plugin manager after a fresh install
  home.activation = let
    paq_dir = "${config.xdg.dataHome}/nvim/site/pack/paqs/start/paq-nvim";
    paq_upstream = "https://github.com/savq/paq-nvim.git";
    nvim = "PATH=${pkgs.git}/bin:$PATH ${config.programs.neovim.package}/bin/nvim";
  in {
    nvimInstallPlugins = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run sh -c '
        if [ ! -d "${paq_dir}" ]; then
          ${pkgs.git}/bin/git clone --depth=1 "${paq_upstream}" "${paq_dir}"
          ${nvim} --headless +"autocmd User PaqDoneSync qall" +PaqSync
        fi
      '
    '';
  };
}
