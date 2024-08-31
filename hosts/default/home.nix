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
    brightnessctl
    ripdrag

    # Development tools
    tokei highlight
    patch meld
    binutils

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
    syncthing
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

    # https://discourse.nixos.org/t/audio-plugins-no-longer-detected-after-switching-to-nix-2-4-flakes/17177/4
    DSSI_PATH = "$HOME/.dssi:$HOME/.nix-profile/lib/dssi:/run/current-system/sw/lib/dssi:/etc/profiles/per-user/$USER/lib/dssi";
    LADSPA_PATH = "$HOME/.ladspa:$HOME/.nix-profile/lib/ladspa:/run/current-system/sw/lib/ladspa:/etc/profiles/per-user/$USER/lib/ladspa";
    LV2_PATH = "$HOME/.lv2:$HOME/.nix-profile/lib/lv2:/run/current-system/sw/lib/lv2:/etc/profiles/per-user/$USER/lib/lv2";
    LXVST_PATH = "$HOME/.lxvst:$HOME/.nix-profile/lib/lxvst:/run/current-system/sw/lib/lxvst:/etc/profiles/per-user/$USER/lib/lxvst";
    VST_PATH = "$HOME/.vst:$HOME/.nix-profile/lib/vst:/run/current-system/sw/lib/vst:/etc/profiles/per-user/$USER/lib/vst";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
