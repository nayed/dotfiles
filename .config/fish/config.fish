# load aliases
source ~/.config/fish/aliases.fish

source ~/.config/fish/api_env.fish

# Hide greeting
function fish_greeting
end

# add git autocomplete to hub
complete -c hub -w git

# cd and ls
function chpwd --on-variable PWD
  status --is-command-substitution; and return
  ll
end

# FZF
set -gx BAT_THEME "GitHub"
set -gx FZF_COMPLETION_OPTS "--preview 'bat --color=always {} || cat {} || tree -C {} 2> /dev/null | head -200'"
set -gx FZF_CTRL_T_OPTS "$FZF_COMPLETION_OPTS"
set -gx FZF_DEFAULT_COMMAND  'rg --files --no-ignore-vcs --hidden'
set -gx FZF_CTRL_T_COMMAND "command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"
set -gx FZF_ALT_C_OPTS "--preview 'tree -C {} | head -200'"
set -gx FZF_DEFAULT_OPTS '--height 70% --reverse'

set -x -U GOPATH $HOME/Codes/go
set -x -U GOBIN $GOPATH/bin
set -gx PATH $PATH $GOBIN

# enable rbenv
status --is-interactive; and source (rbenv init -|psub)

# jump
status --is-interactive; and source (jump shell | psub)

# asdf
set -gx PATH $PATH ~/.asdf/shims

set -gx PATH $PATH ~/.local/bin

set -gx EDITOR nvim
