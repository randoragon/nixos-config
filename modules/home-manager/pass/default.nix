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

  home.file.".local/bin/ppush".source = ./ppush;
  home.file.".local/bin/ppull".source = ./ppull;
}
