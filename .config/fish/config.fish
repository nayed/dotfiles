# load aliases
. ~/.config/fish/aliases.fish

# Hide greeting
function fish_greeting
end

# add git autocomplete to hub
complete -c hub -w git

# jump
status --is-interactive; and . (jump shell | psub)

# cd and ls
function chpwd --on-variable PWD
  status --is-command-substitution; and return
  ll
end

# add elixir to path
set -gx PATH $PATH ~/.elixir/bin

 # use ag
set -g FZF_DEFAULT_COMMAND 'ag --hidden -U --ignore .git -g ""'
# To apply the command to CTRL-T as well
set -g FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
# preview
set -g FZF_CTRL_T_OPTS "--preview 'rougify {} 2> /dev/null | head -200'"
set -g FZF_ALT_C_OPTS "--preview 'tree -C {} | head -200'"
set -g FZF_DEFAULT_OPTS '--height 70% --reverse'
