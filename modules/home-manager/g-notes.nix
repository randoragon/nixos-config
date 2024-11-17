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

  home.sessionVariables = {
    # This makes markdown previews bearable to look at, just prepend the html
    # file with it.
    HTML_MD_STYLE = ''
      <style>
      table, th, td {
          padding: 5px;
          border: 1px solid black;
          border-collapse: collapse;
      }

      body {
          font-family: 'Libertinus Serif', sans-serif;
          margin: 0 auto;
          max-width: 48rem;
          line-height: 1.45;
          padding: .25rem;
      }

      code {
          font-family: 'Jetbrains Mono';
          font-size: 10pt;
      }
      </style>
    '';
  };
}
