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

# add elixir to path
# set -gx PATH $PATH ~/.elixir/bin

 # use ag
set -g FZF_DEFAULT_COMMAND 'ag --hidden -U --ignore .git -g ""'
# To apply the command to CTRL-T as well
set -g FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
# preview
set -g FZF_CTRL_T_OPTS "--preview 'coderay {} 2> /dev/null | head -200'"
set -g FZF_ALT_C_OPTS "--preview 'tree -C {} | head -200'"
set -g FZF_DEFAULT_OPTS '--height 70% --reverse'

set -x -U GOPATH $HOME/Codes/go
set -x -U GOBIN $GOPATH/bin
set -gx PATH $PATH $GOBIN

# enable rbenv
status --is-interactive; and source (rbenv init -|psub)

# jump
status --is-interactive; and source (jump shell | psub)

# asdf
set -gx PATH $PATH ~/.asdf/shims
