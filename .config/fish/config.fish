# load aliases
source ~/.config/fish/aliases.fish

if test -f ~/.config/fish/api_env.fish
  source ~/.config/fish/api_env.fish
end

# Hide greeting
function fish_greeting
end

# cd and ls
function chpwd --on-variable PWD
  status --is-command-substitution; and return
  ll
end

set -gx BAT_THEME "gruvbox-light"

# GOPATH/GOBIN are universal (-U), so this only needs to run once ever —
# harmless to leave here, but it won't re-append itself thanks to fish_add_path below.
set -x -U GOPATH $HOME/Codes/go
set -x -U GOBIN $GOPATH/bin

set -gx EDITOR nvim

# needed to exist for fd and other cli to use real term color
set -gx LS_COLORS ""

set -gx PAGER "most"
# Colors in man pages with most
# set -gx GROFF_NO_SGR 1 # https://github.com/jedsoft/most/issues/9#issuecomment-3121634102
# set -gx MANPAGER "most"
set -gx MANPAGER "nvim +Man!"

# Dedupe PATH in case old duplicate entries are already baked into an
# inherited environment (e.g. a long-running tmux server from before this fix)
set -gx PATH (string join \n -- $PATH | awk '!seen[$0]++')

# PATH additions — fish_add_path is idempotent, safe to re-run every session
fish_add_path $GOBIN
fish_add_path ~/.asdf/shims
fish_add_path ~/.local/bin
# ~/.cargo/bin is already added by conf.d/rustup.fish via ~/.cargo/env.fish

if status is-interactive
  # FZF
  # Set up fzf key bindings
  fzf --fish | source
  set -gx FZF_COMPLETION_OPTS "--preview 'bat --color=always {} || cat {} || tree -C {} 2> /dev/null | head -200'"
  set -gx FZF_CTRL_T_OPTS "$FZF_COMPLETION_OPTS"
  set -gx FZF_DEFAULT_COMMAND  'rg --files --no-ignore-vcs --hidden'
  set -gx FZF_CTRL_T_COMMAND "command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"
  set -gx FZF_ALT_C_OPTS "--preview 'tree -C {} | head -200'"
  set -gx FZF_DEFAULT_OPTS '--height 70% --reverse'

  # jump
  jump shell fish | source
end