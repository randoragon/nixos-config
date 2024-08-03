{
  programs.lf = {
    enable = true;
    extraConfig = builtins.readFile ./lfrc;
  };
}
