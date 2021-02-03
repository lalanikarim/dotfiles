#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export EDITOR="vim"

alias open=xdg-open
[[ -d $HOME/Android/Sdk/platform-tools ]] && export PATH=$HOME/Android/Sdk/platform-tools:"$PATH"
#export PATH=`npm -g bin`:"$PATH"
#[[ -d $HOME/.node_modules/bin ]] && export PATH=$HOME/.node_modules/bin:"$PATH"
[[ -d $HOME/flutter/bin ]] && export PATH=$HOME/flutter/bin:"$PATH"
#[[ -d /usr/lib/dart/bin ]] && export PATH="$PATH":/usr/lib/dart/bin
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/.local/bin"
export PATH="$PATH:/home/karim/.local/share/coursier/bin"
#alias largefolders="du . -h -d 1 | grep \"[0-9]G\""
#alias largefiles="ls -lah | grep \"[0-9]G\""
alias largefiles='ls -lah | grep "[0-9]G"'
alias largefolders='du . -h -d 1 | grep "[0-9]G"'
alias vim='~/Apps/nvim.appimage' # -u ~/.config/nvim-nightly/init.vim'
alias tmux='tmux attach || tmux'

eval "$(starship init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -d "`npm -g bin`" ] && export PATH=`npm -g bin`:"$PATH"

. ~/.cargo/env
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/library/
#export PATH="$HOME/.cargo/bin:$PATH"

[ -d ~/emsdk ] && . ~/emsdk/emsdk_env.sh

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.bash ] && . ~/.config/tabtab/__tabtab.bash || true

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
