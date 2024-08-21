{ pkgs, ... }: {
  home.pointerCursor = {
    package = pkgs.simp1e-cursors;
    name = "Simp1e-Adw-Dark";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}
