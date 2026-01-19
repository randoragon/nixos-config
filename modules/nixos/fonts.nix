# Not always needed, but it's the easiest to just install the fonts system-wide.
{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    jetbrains-mono
    dejavu_fonts
    noto-fonts-color-emoji
    texlivePackages.opensans
    cm_unicode  # Computer Modern; LaTeX's default font
    font-awesome
    ipafont
    liberation_ttf
    carlito
    libertinus
    unifont
  ];
}
