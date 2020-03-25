# =====
# ===== Start
# =====

# 将光标切换为插入模式
echo -ne '\e[5 q'
# 加载p10k-instant-prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =====
# ===== Zinit
# =====

source "$HOME/.zinit/bin/zinit.zsh"

# powerlevel10k 
zinit ice depth=1
zinit light romkatv/powerlevel10k

# 快速目录跳转
zinit ice lucid wait='1'
zinit light skywind3000/z.lua

# 语法高亮
zinit ice lucid wait atinit='zpcompinit'
zinit light zdharma/fast-syntax-highlighting

# 自动建议
zinit ice lucid wait atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# 补全
zinit ice lucid wait blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# 加载 OMZ 框架及部分插件
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

# vi-mode
zinit snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh

# 解压缩
zinit ice svn lucid wait='1' 
zinit snippet OMZ::plugins/extract

# git
zinit ice lucid wait='1' 
zinit snippet OMZ::plugins/git/git.plugin.zsh

# =====
# ===== Export 
# =====

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export PATH="/home/orongxing/miniconda3/bin:$PATH"  # commented out by conda initialize  # commented out by conda initialize
export PATH="/home/orongxing/miniconda3/envs/python36/bin:$PATH"  # commented out by conda initialize
export PATH="/home/orongxing/miniconda3/envs/python27/bin:$PATH"  # commented out by conda initialize
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin
export RANGER_LOAD_DEFAULT_RC="false"
export EDITOR=nvim
export DOWNGRADE_FROM_ALA=1


# =====
# ===== Alias
# =====

alias note='vim ~/.note.md'
alias aria='aria2c -D --conf-path=/home/orongxing/.aria2.conf'
alias ls="exa"
alias open='xdg-open'
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


# =====
# ===== User configuration
# =====

# Vi-Mode
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
preexec() {
	echo -ne '\e[5 q'
}
_fix_cursor() {
	echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)
zle -N zle-line-init
zle -N zle-keymap-select

# FZF
export FZF_DEFAULT_OPTS='--bind ctrl-j:down,ctrl-k:up --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_COMPLETION_TRIGGER='\'
export FZF_PREVIEW_COMMAND='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Jump to previous folder
cdlast() {
  cd -
  #ls -lrth --color=auto | tail
  zle reset-prompt
}
zle -N cdlast
bindkey '^Z' cdlast

zsh_stats () {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n20
}

function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map q chain shell echo %d > "$tempfile"; quitall"
    )
    
    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

# Thefuck
eval $(thefuck --alias)

# Conda 
__conda_setup="$('/home/orongxing/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/orongxing/miniconda3/etc/profile.d/conda.sh" ]; then
. "/home/orongxing/miniconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
    else
export PATH="/home/orongxing/miniconda3/bin:$PATH"  # commented out by conda initialize
    fi
fi
unset __conda_setup
conda activate python36

# NVM
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm() { . "$NVM_DIR/nvm.sh" ; nvm $@ ; }
export PATH=$HOME/.nvm/versions/node/v13.5.0/bin/:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


