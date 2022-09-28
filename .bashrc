#
# $HOME/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias open=xdg-open
[[ -d $HOME/Android/Sdk/platform-tools ]] && export PATH=$HOME/Android/Sdk/platform-tools:"$PATH"
#export PATH=`npm -g bin`:"$PATH"
#[[ -d $HOME/.node_modules/bin ]] && export PATH=$HOME/.node_modules/bin:"$PATH"
[[ -d $HOME/flutter/bin ]] && export PATH=$HOME/flutter/bin:"$PATH"
#[[ -d /usr/lib/dart/bin ]] && export PATH="$PATH":/usr/lib/dart/bin
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/.local/bin"
export PATH="$PATH":"$HOME/go/bin"
export PATH="$PATH":"$HOME/.yarn/bin"
export PATH="$PATH":"$HOME/dotnet"
export PATH="$PATH":"$HOME/.dotnet/tools"
export PATH="$PATH":"$HOME/.local/share/coursier/bin"
export PATH="$PATH":"$HOME/elixir/bin"
#alias largefolders="du . -h -d 1 | grep \"[0-9]G\""
#alias largefiles="ls -lah | grep \"[0-9]G\""
alias largefiles='ls -lah | grep "[0-9]G"'
alias largefolders='du . -h -d 1 | grep "[0-9]G"'
#alias vim='$HOME/Apps/nvim.appimage' # -u $HOME/.config/nvim-nightly/init.vim'
alias nvim='$HOME/Apps/nvim.appimage'
alias vim='nvim'
#alias tmuxattach='tmux attach || tmux'
alias tmuxattach='tmux attach -t default || tmux new -s default'
alias email="tmux rename-window email && mutt -e \"push '<f10>'\""
alias calendar="tmux rename-window calendar && khal interactive"
alias docker-compose=podman-compose
export EDITOR=$HOME/Apps/nvim.appimage

eval "$(starship init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#[ -d "`npm -g bin`" ] && export PATH=`npm -g bin`:"$PATH"

. $HOME/.cargo/env
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/library/
#export PATH="$HOME/.cargo/bin:$PATH"

[ -d $HOME/emsdk ] && . $HOME/emsdk/emsdk_env.sh

# tabtab source for packages
# uninstall by removing these lines
#[ -f $HOME/.config/tabtab/__tabtab.bash ] && . $HOME/.config/tabtab/__tabtab.bash || true

[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash

[ -f $HOME/.local/bin/az.completion.sh ] && . $HOME/.local/bin/az.completion.sh || true

export KUBECONFIG=$HOME/.kube/config
source <(kubectl completion bash)
source <(helm completion bash)
source <(flutter bash-completion)

export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet

#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#  tmux attach -t default || tmux new -s default
#fi

[ -f $HOME/.local/bin/yq ] && source <(yq shell-completion bash)

export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_STUDIO_DIR=$(ls -d $HOME/.local/share/JetBrains/Toolbox/apps/AndroidStudio/ch-0/* | grep "[0-9]\+$" | sort | tail -n 1)
# Run the below if `flutter doctor` is unable to find installed Android Studio
# flutter config --android-studio-dir=$ANDROID_STUDIO_DIR
