alias gitcleanbranches='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias dockerkillall='docker container kill $(docker ps -q)'

# https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
