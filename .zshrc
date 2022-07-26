export ZSH=/Users/dan/.oh-my-zsh

ZSH_THEME="robbyrussell"

# rbenv
eval "$(rbenv init -)"

CASE_SENSITIVE="true"

plugins=(git dash zsh-autosuggestions sudo history ssh-agent)

source $ZSH/oh-my-zsh.sh

# Open in Xcode
function xc {
  xcode_proj=`find . -name "*.xc*" -d 1 | sort -r | head -1`
  package_path="Package.swift"

  if [[ -f $package_path ]]; then
    open -a "Xcode" "."
  elif [[ `echo -n $xcode_proj | wc -m` != 0 ]]; then
    echo "Found $xcode_proj"
    open "$xcode_proj"
  else
    echo "No xcworkspace/xcodeproj/Package.swift file found in the current directory."
  fi
}

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Aliases
alias vim=nvim
alias be="bundle exec"
alias bfast="be fastlane"
alias reactn="react-native"
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

