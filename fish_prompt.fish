function fish_prompt
  echo ''

  set_color green
  # replace home path with ~
  echo -n (echo $PWD | sed 's|^'$HOME'\(.*\)$|~\1|')

  set_color cyan
  set -l git_branch (git branch 2> /dev/null | grep --color=never -e '*.\(.*\)' | colrm 1 2)
  echo " $git_branch"

  set_color blue
  echo -n '→ '
end
