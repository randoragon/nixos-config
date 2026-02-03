{ lib, ... }: {
  programs.git = lib.mkForce {
    enable = true;

    signing.key = null;
    signing.signByDefault = false;

    settings = {
      user.email = "piotrkas@mikronika.com.pl";
      user.name = "Piotr Kaszubski";

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
    };
  };
}
