#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

if [[ -s "/opt/boxen/env.sh" ]]; then
  source "/opt/boxen/env.sh"
fi

if [[ -s "/opt/rbenv" ]]; then
  export RBENV_ROOT=/opt/rbenv
  export PATH=$RBENV_ROOT/bin:/opt/rbenv/bin/rbenv:$PATH
  eval "$(rbenv init -)"
fi

if [[ -s "/etc/chef/role" ]]; then
  export RAILS_ENV=production
  XDG_CONFIG_HOME=/tmp
fi
