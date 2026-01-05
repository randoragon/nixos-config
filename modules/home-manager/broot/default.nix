{ pkgs, ... }: {
  programs.broot = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    settings = {
      verbs = [
        { key = "Down"; internal = ":line_down_no_cycle"; }
        { key = "Up"; internal = ":line_up_no_cycle"; }
        { key = "alt-j"; internal = ":line_down_no_cycle"; }
        { key = "alt-k"; internal = ":line_up_no_cycle"; }
        { key = "alt-d"; internal = ":page_down"; }
        { key = "alt-u"; internal = ":page_up"; }
        { key = "alt-f"; internal = ":page_down"; }
        { key = "alt-b"; internal = ":page_up"; }
      ];
    };
  };
}
