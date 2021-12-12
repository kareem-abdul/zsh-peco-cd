# zsh-peco-cd 0.0.1
#
# search for directories with peco when pressing ctrl+f
#
# Requirements
# 	- peco : https://github.com/peco/peco
# 	- zsh  : https://www.zsh.org/
#
# Based on: https://github.com/jimeh/zsh-peco-history.git

if (( $+commands[peco] ))
then

	if [ -z $ZSH_PECO_CD_IGNORE_PATHS ]
	then
		ZSH_PECO_CD_IGNORE_PATHS="node_modules|\.git|\.cache|\.config";
	fi

	if [ -z $ZSH_PECO_CD_ROOT ]
	then
		ZSH_PECO_CD_ROOT=$([ $(id -u) -eq 0 ] && echo "/" || echo "$HOME");
	fi

	function peco_select_directories() {
		find ${=ZSH_PECO_CD_ROOT} -type d | grep -E -v $ZSH_PECO_CD_IGNORE_PATHS | peco --layout=bottom-up | read BUFFER
		
		if [ ! -z $BUFFER ]
		then
			builtin cd $BUFFER
			zle kill-whole-line
			zle accept-line
			return 0
		fi
		
		zle -R -c
	}

	zle -N  peco_select_directories
	bindkey '^F' peco_select_directories

fi



