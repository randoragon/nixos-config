{ pkgs, config, ... }: {
  programs.password-store = {
    enable = true;
    package = pkgs.pass-nodmenu;
    settings = {
      PASSWORD_STORE_DIR = "${config.xdg.dataHome}/pass";
      PASSWORD_STORE_ENABLE_EXTENSIONS = "false";
      PASSWORD_STORE_GENERATED_LENGTH = "32";
      PASSWORD_STORE_CLIP_TIME = "30";
    };
  };
}
