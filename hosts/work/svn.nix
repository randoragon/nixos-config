{ pkgs, ... }: {
  home.packages = with pkgs; [ subversion ];

  # Force SVN to use gpg-agent for auth (https://stackoverflow.com/a/57579018)
  home.file.".subversion/config" = {
    text = ''
      [auth]
      password-stores = gpg-agent
      [helpers]
      [tunnels]
      [miscellany]
      [auto-props]
      [working-copy]
    '';
  };
  home.file.".subversion/servers" = {
    text = ''
      [groups]
      [global]
      store-passwords = yes
      store-plaintext-passwords = no
    '';
  };

  # Wrap SVN with a script that exports GPG_AGENT_INFO from gpg-agent
  home.file.".local/bin/svn" = {
    text = ''
      #!/bin/sh

      export GPG_AGENT_INFO="$(gpgconf --list-dirs agent-socket | tr -d '\n' && echo -n ::)"
      exec ${pkgs.subversion}/bin/svn "$@"
    '';
    executable = true;
  };
}
