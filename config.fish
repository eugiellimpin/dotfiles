# PATH
set PATH $PATH /Applications/Postgres.app/Contents/Versions/9.5/bin
# work-around for rbenv's `rbenv init` installation step see
# https://github.com/sstephenson/rbenv/issues/195
set PATH ~/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

function fish_prompt
  echo ''

  set_color green
  # replace home path with ~
  echo -n (echo $PWD | sed 's|^'$HOME'\(.*\)$|~\1|')

  set_color magenta
  set -l git_branch (git branch 2> /dev/null | grep --color=never -e '*.\(.*\)' | colrm 1 2)
  echo " $git_branch"

  set_color blue
  echo -n '→ '
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
