alias git_clean_branches='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias docker_kill_all='docker container kill $(docker ps -q)'
alias docker_rm_all_containers='docker container rm $(docker container ls -aq)'
alias docker_rm_all_images='docker image rm $(docker image ls -aq)'

# https://www.atlassian.com/git/tutorials/dotfiles
alias config='/opt/homebrew/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
