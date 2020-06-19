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

alias ls "exa"
alias la "exa -a"
alias ll "exa -l"
alias l "exa -al"

alias cleanplug "rm -rf ~/.local/share/nvim/plugged ~/.config/coc"

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
alias en "n ~/.config/nvim/init.vim"
alias ev "v ~/.vimrc"
alias eb "n ~/.vim/basic.vim"
alias ef "n ~/.vim/full.vim"

# Get local IP
alias localip "ifconfig | grep -Eo 'inet (addr:)?([0-9]*\\.){3}[0-9]*' | grep -Eo '([0-9]*\\.){3}[0-9]*' | grep -v '127.0.0.1'"
# Get IPs. (public ipv6 is the 3rd last)
alias ips "ifconfig -a | grep -o 'inet6\\? \\(addr:\\)\\?\\s\\?\\(\\(\\([0-9]\\+\\.\\)\\{3\\}[0-9]\\+\\)\\|[a-fA-F0-9:]\\+\\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# untar
alias untar "tar xvf"

alias ri "ri -Tf ansi"
