# ~/.bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# aliases

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias prog='cd ~/Programming/Prv/'

# prompt

parse_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

NC='\033[0m'
COLOR="\[\033[32m\]"
PS1="${COLOR}[ \033[1m\W ]\$(parse_branch) ❱❱❱ ${NC}"

. "$HOME/.atuin/bin/env"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"

#neofetch