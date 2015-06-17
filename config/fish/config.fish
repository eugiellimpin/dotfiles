set PATH ~/.rbenv/bin $PATH

# work-around for rbenv's `rbenv init` installation step
# see https://github.com/sstephenson/rbenv/issues/195
set PATH ~/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# ALIASES
alias g="git"
alias r="rails"
