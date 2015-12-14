export LANG=ja_JP.UTF-8
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
eval "$(rbenv init -)"
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
nvm use stable > /dev/null
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH=$PATH:/Users/regonn/Library/Android/sdk/platform-tools
export PATH=$PATH:/Users/regonn/Library/Android/sdk/tools
export STUDIO_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk
export CONFIGURE_ARGS="with-pg-config=/Applications/Postgres.app/Contents/Ve    rsions/9.4/bin/pg_config"
export PGHOST=localhost

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
