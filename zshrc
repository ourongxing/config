# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
eval $(thefuck --alias)
# Path to your oh-my-zsh installation.
export ZSH="/home/orongxing/.oh-my-zsh"
export PATH="/home/orongxing/miniconda3/bin:$PATH"  # commented out by conda initialize
export PATH="/home/orongxing/miniconda3/envs/python36/bin:$PATH"  # commented out by conda initialize
export PATH="/home/orongxing/miniconda3/envs/python27/bin:$PATH"  # commented out by conda initialize
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin
export RANGER_LOAD_DEFAULT_RC="false"
export EDITOR=nvim

alias vim='nvim'
alias ra='ranger'
alias sudo='sudo '
alias c='clear'
alias s='screenfetch'
alias cat='ccat'
alias bat='tlp bat'
alias ac='tlp ac'
alias lg='lazygit'
alias hexod="bash ~/orxing-blog/hexo-deploy.sh"
# don't use rm
alias tp='trash-put'           # trash files and directories.
alias te='trash-empty'         # empty the trashcan(s).
alias tl='trash-list'          # list trashed files.
alias tr='trash-restore'       # restore a trashed file.
# trash-rm            # remove individual files from the trashcan.

ZSH_THEME="astro"
# autoload -U promptinit; promptinit
# prompt pure

plugins=(extract last-working-dir zsh-autosuggestions autojump extract zsh-syntax-highlighting thefuck vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# fzf
export FZF_DEFAULT_OPTS='--bind ctrl-j:down,ctrl-k:up --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_COMPLETION_TRIGGER='\'
export FZF_PREVIEW_COMMAND='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# nvm
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm() { . "$NVM_DIR/nvm.sh" ; nvm $@ ; }
export PATH=$HOME/.nvm/versions/node/v13.5.0/bin/:$PATH

# atuosuggestion
bindkey ';' autosuggest-accept

# jump to previous folder
cdlast() {
  cd -
  #ls -lrth --color=auto | tail
  zle reset-prompt
}
zle -N cdlast
bindkey '^Z' cdlast

# vi-mode 光标
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

  # Use beam shape cursor on startup.
echo -ne '\e[5 q'

  # Use beam shape cursor for each new prompt.
preexec() {
	echo -ne '\e[5 q'
}

_fix_cursor() {
	echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)


zle -N zle-line-init
zle -N zle-keymap-select

