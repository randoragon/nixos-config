{ pkgs, ... }: {
  home.packages = with pkgs; [ bluetuith ];

  xdg.configFile."bluetuith/bluetuith.conf" = {
    text = ''
      {
        keybindings: {
          NavigateDown: j
          NavigateUp: k
          Quit: q
        }
      }
    '';
  };
}
