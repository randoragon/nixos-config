{ config, ... }: {
  programs.swaylock = {
    enable = true;
    settings = {
      image = "${config.xdg.configHome}/wallpaper";
      indicator-idle-visible = true;
    };
  };
}
