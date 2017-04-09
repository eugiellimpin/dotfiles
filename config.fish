# PATH
set PATH $PATH /Applications/Postgres.app/Contents/Versions/9.5/bin
# work-around for rbenv's `rbenv init` installation step see
# https://github.com/sstephenson/rbenv/issues/195
set PATH ~/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

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

# ABBREVIATIONS
#abbr -a g='git'
#abbr -a gco='git checkout'
#abbr -a gb='git branch -v'
#abbr -a gnb='git checkout -b'
#abbr -a gl='git log --pretty=oneline -n20 --graph --abbrev-commit'
#abbr -a grb='git rebase'
#abbr -a grc='git rebase --continue'
#
#abbr -a r='rails'
#abbr -a rs='rails s'
#abbr -a rc='rails c'
#
#abbr -a t='tmux'
#abbr -a tls='tmux ls'
#abbr -a td='tmux detach'
#abbr -a tas='tmux attach-session -t'

alias vim nvim

# When hitting CTRL-C Fish will clear the prompt instead of printing ^C, a
# newline and starting a new prompt (starting v2.4.0). See
# https://github.com/fish-shell/fish-shell/issues/3537#issuecomment-260275405
function fish_user_key_bindings
  bind \cc 'commandline ""'
end

# Exports
set --export EDITOR vim
set --export PROJECTS_DIR ~/code
set --export QUIPPER_PROJECTS_DIR "$PROJECTS_DIR/Quipper"
