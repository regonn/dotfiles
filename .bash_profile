export LANG=ja_JP.UTF-8
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
eval "$(rbenv init - zsh)"
source ~/.nvm/nvm.sh
nvm use v0.12.0 > /dev/null
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export GOPATH=~/gocode
export PATH="$PATH:$GOPATH/bin"
export PATH=$PATH:/Users/regonn/Library/Android/sdk/platform-tools
export PATH=$PATH:/Users/regonn/Library/Android/sdk/tools
export STUDIO_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk


[ -s "/Users/regonn/.nvm/nvm.sh" ] && . "/Users/regonn/.nvm/nvm.sh" # This loads nvm

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

if [ -z "$PS1" ]; then return ; fi

if [ -z $TMUX ] ; then
 tmux
fi
