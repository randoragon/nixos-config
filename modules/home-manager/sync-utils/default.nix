{ pkgs, ... }: {
  home.packages = with pkgs; [ syncthing rclone ];

  home.file.".local/bin/spush".source = ./localbin/spush;
  home.file.".local/bin/spull".source = ./localbin/spull;

  xdg.configFile."spush.list".text = ''
    # This file is a list of directories to sync by spush.
    # Each non-empty line must contain an absolute source path
    # and optionally a destination path relative to the sync dir.
    # Tilde can be used for $HOME.

    ~/Documents/0wn/ Docs
    ~/Pictures/0wn/ Art
    ~/.local/share/lmms/projects LMMS
    ~/.local/share/wallpapers/
    ~/Documents/Books/
    ~/Documents/sheet-music/
    ~/Videos/clips/
    ~/Music/
  '';

  xdg.configFile."spull.list".text = ''
    # This file is a list of directories to sync by spull.
    # Each non-empty line must contain a source path (relative to the sync dir)
    # and destination path (absolute), following rsync's conventions.
    # Tilde can be used for $HOME.

    Docs/ ~/Documents/0wn/
    Art/ ~/Pictures/0wn/
    LMMS/ ~/.local/share/lmms/
    wallpapers/ ~/.local/share/wallpapers/
    Books/ ~/Documents/Books/
    clips/ ~/Videos/clips/
    Music/ ~/Music/
  '';
}
