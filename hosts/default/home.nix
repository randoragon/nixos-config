{ pkgs, config, ... }: {
  imports = [
    ../../modules/home-manager
  ];

  home.username = "pcache";
  home.homeDirectory = "/home/${config.home.username}";

  home.packages = with pkgs; [
    # Graphical session
    swayidle waylock
    swww
    grim slurp swappy
    wl-clipboard
    wlr-randr wdisplays

    # Development tools
    patch
    gcc gdb valgrind gnumake cmake pkg-config
    bear
    zig
    lua
    rustc cargo rustfmt clippy
    tokei highlight
    binutils
    meld

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
    ]))
    typst
    farbfeld
    mscgen

    # Music listening
    mpc-cli
    mp3info mp3gain rsgain
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
    vesktop
    figlet sl asciiquarium
    newsraft
    onedrive
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
