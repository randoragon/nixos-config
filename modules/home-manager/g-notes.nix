# Config group for systems with access to my notes.
{ pkgs, config, ... }: {
  imports = [
    ./note-utils
  ];

  home.packages = with pkgs; [
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
    lilypond
  ];
}
