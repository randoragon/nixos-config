{ config, ... }: {
  home.sessionVariables = {
    GRIM_DEFAULT_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
  };
}
