{ pkgs, ... }: {
  home.packages = with pkgs; [
    thunderbird
    vesktop
    weechat
  ];
}
