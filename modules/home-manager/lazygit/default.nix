{
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        autoStageResolvedConflicts = false;
        autoForwardBranches = "none";
        overrideGpg = true;
        pagers = [
          {
            pager = "delta --dark --paging=never";
          }
        ];
      };
    };
  };
}
