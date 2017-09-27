# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Path to your oh-my-zsh installation.
if [ "$(uname 2> /dev/null)" != "Linux" ]; then
    export ZSH=/Users/nayed/.oh-my-zsh
else
    export ZSH=/home/nayed/.oh-my-zsh
fi
  

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="random"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

  export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


chpwd() ls

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

# mkdir and cd
mkc() {
    mkdir -p "$1" && cd "$1" || return 1
}
_mkc() {
    #compdef mkc
    _files -W "$1" -/
}

# recursive touch
touchp() {
    mkdir -p "$(dirname "$1")/" && touch "$1"
}

if [ -d "$HOME/.fzf" ] ; then
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    # use ag
    export FZF_DEFAULT_COMMAND='ag --hidden -U --ignore .git -g ""'
    # To apply the command to CTRL-T as well
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    # preview
    export FZF_CTRL_T_OPTS="--preview '(coderay {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
    export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
    export FZF_DEFAULT_OPTS='--height 70% --reverse'
fi

if [ -d "$HOME/.fzf" ] ; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

if [ -d "$HOME/.elixir" ] ; then
    export PATH="$HOME/.elixir/bin:$PATH"
fi

# jump
eval "$(jump shell)"

alias n="nvim"
alias v="vim"

# hub
eval "$(hub alias -s)"


if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
  . ~/.config/exercism/exercism_completion.zsh
fi
