{
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        autoStageResolvedConflicts = false;
        autoForwardBranches = "none";
        paging = {
          colorArg = "always";
          pager = "delta --dark --paging=never";
        };
      };
    };
  };
}
