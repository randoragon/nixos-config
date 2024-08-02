{ pkgs, ... }: {
  imports = [
    ../../modules/home-manager
  ];

  home.username = "pcache";
  home.homeDirectory = "/home/pcache";

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
    pass-wayland
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


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/pcache/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
