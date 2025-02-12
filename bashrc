#alias neofetch='neofetch --source /home/joshua/Pictures/neofetch_ascii.txt'
#neofetch

COLOR="\[\033[33m\]"
export PS1="${COLOR}[ \033[1m\W ] ❱❱❱ "

. "$HOME/.atuin/bin/env"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"


