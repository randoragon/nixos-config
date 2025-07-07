{
  programs.git = {
    enable = true;
    delta = {
      enable = true;
      options = {
        line-numbers = true;
        navigate = true;
        file-decoration-style = "box";
        hunk-header-decoration-style = "ol";
      };
    };

    userEmail = "randoragongamedev@gmail.com";
    userName = "randoragon";

    signing.key = "0x8A07E8710BC97B4D5478E419D0693F85BC6D731F!";
    signing.signByDefault = true;

    aliases = {
      gc-reflog = "!git reflog expire --all --expire=now && git gc --prune=now";
    };

    extraConfig = {
      diff.submodule = "log";
      merge.conflictstyle = "diff3";
      pull.rebase = false;
      rebase.abbreviateCommands = true;
      status.submoduleSummary = 1;
      submodule.fetchJobs = 0;
      rerere.enabled = true;

      # Sign pass commits (https://www.passwordstore.org/)
      pass.signcommits = true;
    };
  };
}
