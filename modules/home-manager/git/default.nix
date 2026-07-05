{
  programs.git = {
    enable = true;

    signing.format = "openpgp";
    signing.key = "0xEFE4E6F7BF76B823DFB5D7B7A8C82721C07BA3FD!";
    signing.signByDefault = true;

    settings = {
      user.email = "randoragongamedev@gmail.com";
      user.name = "randoragon";

      alias = {
        gc-reflog = "!git reflog expire --all --expire=now && git gc --prune=now";
      };

      diff.submodule = "log";
      merge.conflictstyle = "diff3";
      pull.rebase = false;
      rebase.abbreviateCommands = true;
      status.submoduleSummary = 1;
      submodule.fetchJobs = 0;
      rerere.enabled = true;
      worktree.guessRemote = true;

      # Sign pass commits (https://www.passwordstore.org/)
      pass.signcommits = true;
    };
  };
}
