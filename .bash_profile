#
# ~/.bash_profile
#

#[[ -f ~/.bashrc ]] && . ~/.bashrc

#PATH="$HOME/.node_modules/bin:$PATH"
#export npm_config_prefix=~/.node_modules
#alias largefolders="du . -h -d 1 | grep \"[0-9]G\""
#alias largefiles="ls -lah | grep \"[0-9]G\""
#alias hlcomposer="`npm -g bin`/composer"
#alias open=xdg-open

[[ -f ~/.bashrc ]] && . ~/.bashrc

#

# Added by Toolbox App
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
. "$HOME/.cargo/env"

if [ -e /home/karim/.nix-profile/etc/profile.d/nix.sh ]; then . /home/karim/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
export OLLAMA_HOST=aurora
