if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit -u
fi

export PATH=$HOME/.nodebrew/current/bin:$PATH

# nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

PROMPT="%1~ %# "

alias ll='ls -laF --color'
alias sail='./vendor/bin/sail'
alias gg='git grep -i'
alias gl='git grep -l -i'

eval "$(rbenv init -)"
#export PATH="/usr/local/bin:$PATH"


function prco() {
  local BRANCH_NAME=$(gh pr view $1 --json headRefName -q .headRefName)
  git fetch origin $BRANCH_NAME && git checkout $BRANCH_NAME
}

