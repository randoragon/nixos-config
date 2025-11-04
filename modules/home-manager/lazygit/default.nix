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
            pager = "delta --dark --paging=never --line-numbers --hyperlinks --hyperlinks-file-link-format='lazygit-edit://{path}:{line}'";
          }
        ];
      };
    };
  };
}
