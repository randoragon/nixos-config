{
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        autoStageResolvedConflicts = false;
        autoForwardBranches = "none";
        overrideGpg = true;
        diffRenderers = [
          {
            command = "delta --dark --paging=never --line-numbers --hyperlinks --hyperlinks-file-link-format='lazygit-edit://{path}:{line}'";
          }
        ];
      };
    };
  };
}
