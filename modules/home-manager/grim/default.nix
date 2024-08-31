{ pkgs, config, ... }: {
  home.packages = with pkgs; [ grim ];

  home.sessionVariables = {
    GRIM_DEFAULT_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
  };
}
