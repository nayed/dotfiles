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