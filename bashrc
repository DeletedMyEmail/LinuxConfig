#alias neofetch='neofetch --source /home/joshua/Pictures/neofetch_ascii.txt'
#neofetch

parse_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

COLOR="\[\033[33m\]"

export PS1="${COLOR}[ \033[1m\W ]\$(parse_branch) ❱❱❱ "

. "$HOME/.atuin/bin/env"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"

