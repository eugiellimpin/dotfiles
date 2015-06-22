set PATH $PATH /Applications/Postgres.app/Contents/Versions/9.3/bin
set PATH ~/.rbenv/bin $PATH

# work-around for rbenv's `rbenv init` installation step
# see https://github.com/sstephenson/rbenv/issues/195
set PATH ~/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# ABBREVIATIONS
abbr -a gco='git checkout'
abbr -a gb='git branch -v'
abbr -a gnb='git checkout -b'
abbr -a gl='git log --pretty=oneline -n20 --graph --abbrev-commit'
abbr -a grb='git rebase'
abbr -a grc='git rebase --continue'

abbr -a rs='rails s'
abbr -a rc='rails c'
