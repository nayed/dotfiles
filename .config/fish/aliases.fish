alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
alias ...... "cd ../../../../.."

# There's a function at functions/git.fish that already map git to hub
alias g "git"

alias pyg "pygmentize"
alias n "nvim"
alias v "vim"

alias ls "eza"
alias la "eza -a"
alias ll "eza -l"
alias l "eza -al"

alias bat "batcat"

alias freshneovim "rm -rf \
  ~/.local/share/nvim/mason \
  ~/.local/share/nvim/site/pack/core/opt"

alias brewup "brew update && brew upgrade"

alias cleanview "rm -rf ~/.local/share/nvim/view ~/.vim/view"
alias cleann "rm -rf ~/.local/share/nvim/view"
alias cleanv "rm -rf ~/.vim/view"

alias npm-list "npm list --depth 0"
alias npm-list-g "npm list -g --depth 0"
alias npm-outdated "npm outdated --depth 0"
alias npm-outdated-g "npm outdated -g --depth 0"

alias ea "n ~/.config/fish/aliases.fish"
alias ec "n ~/.config/fish/config.fish"
alias en "n ~/.config/nvim/init.lua"
alias ev "v ~/.vimrc"
alias eb "n ~/.vim/basic.vim"
alias ef "n ~/.vim/full.vim"
alias eg "n ~/.gitconfig"

# Get local IP
#alias localip "ip -4 -o addr show scope global | awk '{print \$4}' | cut -d/ -f1"
alias ips "ip -o addr show scope global | awk '{print \$4}' | cut -d/ -f1"

# untar
alias untar "tar xvf"

alias ri "ri -Tf ansi"

alias tnew "tmux new -s"
alias tkill "tmux kill-session -t"
alias tat "tmux a -t"
alias tls "tmux ls"

alias cleanregisternvim "rm -rf ~/.local/share/nvim/shada"

# I should probably maybe make a function that takes a bool
alias macosfindershowdotfiles "defaults write com.apple.finder AppleShowAllFiles -boolean true; killall Finder"
alias macosfinderhidedotfiles "defaults write com.apple.finder AppleShowAllFiles -boolean false; killall Finder"

alias diff "delta"
alias ndiff "nvim -d -c 'windo set wrap' -c 'wincmd h' -c 'execute \"normal gg\"' -c 'execute \"normal 0\"'"
