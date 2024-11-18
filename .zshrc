export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git tldr aliases docker-compose docker macos copypath copyfile mvn kubectl 
yarn jsontools)

source $ZSH/oh-my-zsh.sh

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias sshhome="cd ~/.ssh"


alias cls='clear'

# Reload zshrc file to apply changes.
# Allows you to not need to restart terminal for changes to .zshrc to be applied
alias reload='source ~/.zshrc'

alias zs='code ~/.zshrc'

function flushdns(){
    sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
}

### GIT
alias gs='git status'
alias gb="git --no-pager branch"

function grfullme() {
    curr_br=$(git branch --show-current)
    git checkout $(git_main_branch) 
    git pull
    git checkout "$curr_br"
    git merge --no-edit $(git_main_branch)
}

# Delete current branch and checkout to main branch
function gmainDelCurr() {
    curr_br=$(git branch --show-current)
    git checkout $(git_main_branch) 
    git pull
    git branch --delete "$curr_br"
}
