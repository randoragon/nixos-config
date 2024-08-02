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

    signing.key = "0x033330609EB240A515E4B5BDFE00DCDB97D196C1!";
    signing.signByDefault = true;

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
