{
  programs.less = {
    enable = true;
    config = ''
      #command
      h left-scroll
      l right-scroll
      ^N next-file
      ^P prev-file

      #env
      LESS=-MSWRi -j3 --use-color
    '';
  };

  home.sessionVariables = {
    PAGER = "less";
  };
}
