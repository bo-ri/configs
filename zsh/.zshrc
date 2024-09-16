# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:~/Library/Python/2.7/bin:$GOPATH/bin:~/.bin:~/.cargo/bin:$PATH

export EDITOR=vim
export STARSHIP_CONFIG=~/.config/starship.toml

## fzf on tmux の設定
export FZF_TMUX=1
export FZF_TMUX_OPTS="-p 95%"
export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_OPTS="--preview 'bat  --color=always --style=header,grid {}'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

function wn(){ 
    if [ "$1" = "" ]; then
        curl -4 http://wttr.in/Tokyo
    else
	    curl -4 http://wttr.in/$1
    fi
}

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias ls="ls --color"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

## zsh-completions setting
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  autoload -Uz compinit && compinit
fi

# starship
eval "$(starship init zsh)"
# bun completions
[ -s "/Users/tatsuyakitabori/.bun/_bun" ] && source "/Users/tatsuyakitabori/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(mise activate zsh)"
