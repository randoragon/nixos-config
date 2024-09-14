{
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        autoStageResolvedConflicts = false;
        paging = {
          colorArg = "always";
          pager = "delta --dark --paging=never";
        };
      };
    };
  };
}
