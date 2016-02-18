set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.7.0_60.jdk/Contents/Home
set PATH $PATH /Applications/grails-2.0.1/bin
set PATH $PATH /Applications/Postgres.app/Contents/Versions/9.3/bin
set PATH ~/.rbenv/bin $PATH

# work-around for rbenv's `rbenv init` installation step
# see https://github.com/sstephenson/rbenv/issues/195
set PATH ~/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

set -x EDITOR vim

# ABBREVIATIONS
abbr -a g='git'
abbr -a gco='git checkout'
abbr -a gb='git branch -v'
abbr -a gnb='git checkout -b'
abbr -a gl='git log --pretty=oneline -n20 --graph --abbrev-commit'
abbr -a grb='git rebase'
abbr -a grc='git rebase --continue'
abbr -a gs='git status -s'

abbr -a r='rails'
abbr -a rs='rails s'
abbr -a rc='rails c'

abbr -a t='tmux'
abbr -a tls='tmux ls'
abbr -a td='tmux detach'
abbr -a tas='tmux attach-session -t'

function fish_prompt
  set last_command_status $status

  echo ''

  set_color green
  # replace entire home path with ~
  echo -n (echo $PWD | sed 's|^'$HOME'\(.*\)$|~\1|')
  set_color normal

  set git_directory (git rev-parse --git-dir ^/dev/null)

  if test $status = 0
    echo -n ' '
    set_color 777
    set git_branch (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')

    if test $status = 0
      echo -n $git_branch
    end

    set -e git_branch
    set_color normal
  end
 
  set -e git_directory

  echo ''

  echo -n '❯ '
end

set -x QUIPPER_PROJECTS_DIR ~/Projects/Quipper
set -x PROJECTS_DIR ~/Projects
