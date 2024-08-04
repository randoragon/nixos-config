{ pkgs, config, ... }: {
  imports = [
    ../../modules/home-manager
  ];

  home.username = "pcache";
  home.homeDirectory = "/home/${config.home.username}";

  home.packages = with pkgs; [
    # Development tools
    lazygit patch
    neovim tree-sitter nodejs
    gcc gdb valgrind gnumake cmake pkg-config
    bear
    vscode-langservers-extracted  # HTML, CSS, JSON, Markdown, ESLint
    zig zls
    lua lua-language-server
    nodePackages.bash-language-server shellcheck
    rustc cargo rustfmt clippy rust-analyzer
    tokei highlight
    pyright ruff
    binutils
    meld
    unixtools.xxd

    # Typesetting / presentation
    md4c graphviz gnuplot
    (texliveBasic.withPackages (ps: with ps; [
      collection-latexrecommended
      collection-fontsrecommended
      collection-latexextra
      collection-plaingeneric
      collection-langcjk
      collection-binextra
      collection-bibtexextra
    ])) texlab
    typst typst-lsp
    farbfeld
    mscgen

    # Music listening
    mpd mpc-cli
    (ncmpcpp.override { visualizerSupport = true; clockSupport = true; taglibSupport = false; })
    mp3info mp3gain rsgain
    mpd-discord-rpc
    (python3.withPackages (ps: with ps; [
      musicbrainzngs
    ]))

    # Music production
    alsa-utils
    carla
    x42-plugins
    helm
    geonkick
    distrho
    sfizz
    vmpk
    ardour
    hydrogen
    zynaddsubfx

    # Misc applications
    discord
    syncthing
    yt-dlp
    obs-studio
    figlet sl asciiquarium
    newsraft
    onedrive

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "foot";
    BROWSER = "firefox";
    PAGER = "less";
    PDF_READER = "zathura";

    # This makes markdown previews with tables bearable
    # to look at, just prepend the html file with it
    HTML_MD_STYLE = ''
      <style>
      table, th, td {
          padding: 5px;
          border: 1px solid black;
          border-collapse: collapse;
      }
      </style>
    '';
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
