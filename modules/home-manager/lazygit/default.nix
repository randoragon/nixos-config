{
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        autoStageResolvedConflicts = false;
        autoForwardBranches = "none";
        overrideGpg = true;
        paging = {
          colorArg = "always";
          pager = "delta --dark --paging=never";
        };
      };
    };
  };
}
