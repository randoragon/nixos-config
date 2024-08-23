# Display block or bar cursor depending on vim mode
# Requires the plugin: https://github.com/softmoth/zsh-vim-mode
MODE_CURSOR_VICMD="block"
MODE_CURSOR_VIINS="bar"
MODE_CURSOR_REPLACE="underline"
MODE_CURSOR_SEARCH="underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD"
MODE_CURSOR_VLINE="$MODE_CURSOR_VICMD"

# Hook direnv into the shell (https://direnv.net/docs/hook.html)
eval "$(direnv hook zsh)"
