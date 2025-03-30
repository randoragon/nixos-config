{ pkgs, ... }: {
  home.packages = with pkgs; [vimiv-qt];

  xdg.configFile."vimiv-qt/styles/base16-grayscale-dark".source = ./base16-grayscale-dark;
  xdg.configFile."vimiv-qt/vimiv.conf".source = ./vimiv.conf;
}
