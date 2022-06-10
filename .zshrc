export ZSH=/Users/dan/.oh-my-zsh

ZSH_THEME="robbyrussell"

# rbenv
eval "$(rbenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# hub
eval "$(hub alias -s)"

# Dotfiles
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias vim=nvim
alias be="bundle exec"
alias fast="be fastlane"

alias reactn="react-native"

CASE_SENSITIVE="true"

plugins=(git dash zsh-autosuggestions sudo history ssh-agent)

source $ZSH/oh-my-zsh.sh

function xc {
  xcode_proj=`find . -name "*.xc*" -d 1 | sort -r | head -1`

  if [[ `echo -n $xcode_proj | wc -m` == 0 ]]
  then
    echo "No xcworkspace/xcodeproj file found in the current directory."
  else
    echo "Found $xcode_proj"
    open "$xcode_proj"
  fi
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

