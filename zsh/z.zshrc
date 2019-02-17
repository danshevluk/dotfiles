export ZSH=/Users/dan/.oh-my-zsh

ZSH_THEME="robbyrussell"

# rbenv
eval "$(rbenv init -)"

# hub
eval "$(hub alias -s)"

alias vim=nvim
alias be="bundle exec"
alias reactn="react-native"

CASE_SENSITIVE="true"

plugins=(git)

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


# 🔑🔑🔑
export JUNTO_CRASH_TOKEN=8a09a525d27adb8ca69291189a84ac2e0d22db19
export JUNTO_CRASH_SECRET=8e98fd680865529fb7843c3096d59e0206671b858eceda32889dca90e31d6e82

export GOLOD_CRASH_TOKEN=55be9046dd27e81ca20d35a72135d006ae8edcfe
export GOLOD_CRASH_SECRET=af40d383d8a9ac0ce744ce0cf04bbf36bb2032798e51ccc9af6da0521c2fb6a3

export MIND_CRASH_TOKEN=346fa65a65039aebf0bced364e5689d0bd814112
export MIND_CRASH_SECRET=c59c831c962b02ada0f072ca1ee0ae1a4bbcde268710db6f82c0e2c830f0d120

export FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD=cusu-rbsf-vtux-qocl

export GITHUB_ACCESS_TOKEN=46b4107618ffb61d4c079aa6e2f843c90d942233

export BOXY_APPLE_ID=twistedplane@gmail.com

