#!/usr/local/bin/fish
#
# Code translated to fish from http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
#

set PID %self
set temp_tags_file "$PID.tags"
set git_dir (git rev-parse --git-dir)

function cleanup --on-process-exit $PID
  rm -f $temp_tags_file
end

git ls-files | ctags --tag-relative -L - -f "$git_dir/$temp_tags_file" --languages=-javascript,sql

mv $git_dir/$temp_tags_file $git_dir/tags
