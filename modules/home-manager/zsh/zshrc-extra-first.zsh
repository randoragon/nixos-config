# Enable colors
autoload -U colors && colors

# Populate vcs_info_msg_0_ with formatted git branch name
# https://timothybasanov.com/2016/04/23/zsh-prompt-and-vcs_info.html
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%{$fg[green]%}(%b)"
precmd () { vcs_info; }

# Enable PS1 prompt expansion
setopt prompt_subst

# Prints exit code of last command
exit_code () {
  code=$?
  [ $code -ne 0 ] && col=red || { col=green; code=" " }
  [ $(printf "%d" "$code" | wc -c) = 1 ] && tile="$code " || tile="$code"
  echo "%{$bg[$col]$fg[black]%}${tile}%{$reset_color%}"
}

# Prints the level of nested yazi sessions
lf_level () {
  [ -n "$YAZI_LEVEL" ] && {
      [ $(printf "%d" "$YAZI_LEVEL" | wc -c) = 1 ] && tile="$YAZI_LEVEL " || tile="$YAZI_LEVEL"
      echo "%{$bg[magenta]$fg[black]%}${tile}%{$reset_color%}"
  }
}

# Prints the number of background jobs
no_jobs () {
  num="$(jobs | wc -l)"
  [ "$num" != 0 ] && {
      [ $(printf "%d" "$num" | wc -c) = 1 ] && tile="$num " || tile="$num"
      echo "%{$bg[cyan]$fg[black]%}${tile}%{$reset_color%}"
  }
}

# Basic prompt (username@hostname cwd)
prompt_base="%B%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~"

# Full prompt
PROMPT='$(exit_code)$(lf_level)$(no_jobs) ${prompt_base} ${vcs_info_msg_0_}%{$reset_color%}'$'\n'"$%b "

# Enable variable word splitting
# http://zsh.sourceforge.net/FAQ/zshfaq03.html
setopt shwordsplit

# Tweak directory stack
# http://zsh.sourceforge.net/Intro/intro_6.html
DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

# Bind ctrl-o to yazicd
bindkey -s '^o' 'yazicd\n'

# Enable light-up menu
zstyle ':completion:*' menu select
zmodload zsh/complist

# Enable completion for hidden files
_comp_options+=(globdots)

# Open line in vim for editing
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Navigate tab completion with vim keys
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Emit OSC 7 sequence on directory switch
# https://codeberg.org/dnkl/foot/wiki#user-content-spawning-new-terminal-instances-in-the-current-working-directory
function osc7-pwd() {
    emulate -L zsh # also sets localoptions for us
    setopt extendedglob
    local LC_ALL=C
    printf '\e]7;file://%s%s\e\' $HOST ${PWD//(#m)([^@-Za-z&-;_~])/%${(l:2::0:)$(([##16]#MATCH))}}
}

function chpwd-osc7-pwd() {
    (( ZSH_SUBSHELL )) || osc7-pwd
}
add-zsh-hook -Uz chpwd chpwd-osc7-pwd

# Load jumplist and aliases
[ -f "$HOME/.config/jumprc" ] && . "$HOME/.config/jumprc"
[ -f "$HOME/.config/aliasrc" ] && . "$HOME/.config/aliasrc"
