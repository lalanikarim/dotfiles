#
# $HOME/.bashrc
#

export BASH_SILENCE_DEPRECATION_WARNING=1

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias open=xdg-open
[[ -d $HOME/Android/Sdk/platform-tools ]] && export PATH=$HOME/Android/Sdk/platform-tools:"$PATH"
#export PATH=`npm -g bin`:"$PATH"
#[[ -d $HOME/.node_modules/bin ]] && export PATH=$HOME/.node_modules/bin:"$PATH"
if [[ -d $HOME/flutter/bin ]]
then 
  export PATH=$HOME/flutter/bin:"$PATH"
  source <(flutter bash-completion)
fi
#[[ -d /usr/lib/dart/bin ]] && export PATH="$PATH":/usr/lib/dart/bin
[[ -d $HOME/.pub-cache/bin ]] && export PATH="$PATH":"$HOME/.pub-cache/bin"
[[ -d $HOME/.local/bin ]] && export PATH="$PATH":"$HOME/.local/bin"
[[ -d $HOME/go/bin ]] && export PATH="$PATH":"$HOME/go/bin"
[[ -d $HOME/.yarn/bin ]] && export PATH="$PATH":"$HOME/.yarn/bin"
[[ -d /opt/homebrew/bin ]] && export PATH="$PATH":"/opt/homebrew/bin"

if [ -d $HOME/.dotnet ]
then 
  export PATH="$PATH":"$HOME/.dotnet"
  export DOTNET_ROOT=$HOME/.dotnet
fi

[[ -d $HOME/.dotnet/tools ]] && export PATH="$PATH":"$HOME/.dotnet/tools"
[[ -d $HOME/.local/share/coursier/bin ]] && export PATH="$PATH":"$HOME/.local/share/coursier/bin"
[[ -d $HOME/elixir/bin ]] && export PATH="$PATH":"$HOME/elixir/bin"

if [ -d $HOME/.elixir-install ]
then
  export PATH=$HOME/.elixir-install/installs/otp/27.2.3/bin:$PATH
  export PATH=$HOME/.elixir-install/installs/elixir/1.18.3-otp-27/bin:$PATH
fi
#alias largefolders="du . -h -d 1 | grep \"[0-9]G\""
#alias largefiles="ls -lah | grep \"[0-9]G\""
alias largefiles='ls -lah | grep "[0-9]G"'
alias largefolders='du . -h -d 1 | grep "[0-9]G"'
#alias vim='$HOME/Apps/nvim.appimage' # -u $HOME/.config/nvim-nightly/init.vim'

if [ -f $HOME/Apps/nvim.appimage ] 
then 
  alias nvim='$HOME/Apps/nvim.appimage'
  alias vim='nvim'
  export EDITOR=$HOME/Apps/nvim.appimage
fi

if [ -f /opt/homebrew/bin/nvim ] 
then 
  alias nvim='/opt/homebrew/bin/nvim'
  alias vim='nvim'
  export EDITOR=/opt/homebrew/bin/nvim
fi

#alias tmuxattach='tmux attach || tmux'
alias tmuxattach='tmux attach -t default || tmux new -s default'
alias email="tmux rename-window email && mutt -e \"push '<f10>'\""
alias calendar="tmux rename-window calendar && khal interactive"

if command -v podman >/dev/null 2>&1
then
  alias docker=podman
fi

if command -v podman-compose >/dev/null 2>&1
then
  alias docker-compose=podman-compose
fi

[[ -f $HOME/.local/bin/starship ]] && eval "$(starship init bash)"
[[ -f $HOME/.cargo/bin/starship ]] && eval "$(starship init bash)"

if [ -d $HOME/.nvm ]
then
  export NVM_DIR="$HOME/.nvm"
  [[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
#[ -d "`npm -g bin`" ] && export PATH=`npm -g bin`:"$PATH"

[[ -f $HOME/.cargo/env ]] && source $HOME/.cargo/env
[[ -d $(rustc --print sysroot) ]] && export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/library/
#export PATH="$HOME/.cargo/bin:$PATH"

# [ -d $HOME/emsdk ] && source $HOME/emsdk/emsdk_env.sh

# tabtab source for packages
# uninstall by removing these lines
#[ -f $HOME/.config/tabtab/__tabtab.bash ] && . $HOME/.config/tabtab/__tabtab.bash || true

[[ -f $HOME/.fzf.bash ]] && source $HOME/.fzf.bash

[[ -f $HOME/.local/bin/az.completion.sh ]] && source $HOME/.local/bin/az.completion.sh || true

[[ -f $HOME/.kube/config ]] && export KUBECONFIG=$HOME/.kube/config
[[ -f $HOME/.local/bin/kubectl ]] && source <(kubectl completion bash)
[[ -f $HOME/.local/bin/helm ]] && source <(helm completion bash)


#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#  tmux attach -t default || tmux new -s default
#fi

[[ -f $HOME/.local/bin/yq ]] && source <(yq shell-completion bash)

[[ -d $HOME/Android/Sdk ]] && export ANDROID_SDK_ROOT=$HOME/Android/Sdk

if [[ -d $HOME/.local/share/JetBrains/Toolbox/apps/AndriodStudio ]]
then 
  export ANDROID_STUDIO_DIR=$(ls -d $HOME/.local/share/JetBrains/Toolbox/apps/AndroidStudio/ch-0/* | grep "[0-9]\+$" | sort | tail -n 1)
# Run the below if `flutter doctor` is unable to find installed Android Studio
# flutter config --android-studio-dir=$ANDROID_STUDIO_DIR
fi
export BROWSER=/usr/bin/firefox
export MODULAR_HOME="/home/karim/.modular"
export PATH="/home/karim/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
export SURREAL_PATH="file:$HOME/surrealdb"

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook bash)"
fi

[[ -f $HOME/git-completion.bash ]] && source $HOME/git-completion.bash

clear
