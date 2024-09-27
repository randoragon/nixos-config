# Optional printing support
# Keep disabled if you can, CUPS has questionable security.
{ pkgs, ... }: {
  services.printing.enable = true;
}
