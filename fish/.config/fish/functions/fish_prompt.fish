function fish_prompt
  set -l last_status $status
  set_color yellow
  echo
  echo -n (prompt_pwd)
  set_color normal
  echo -n (__fish_git_prompt)
  if test $last_status -ne 0
    set_color magenta --bold
  end
  echo -n ' ☯ '
  set_color normal
end
