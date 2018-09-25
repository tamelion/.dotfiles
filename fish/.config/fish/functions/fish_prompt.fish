function fish_prompt
  set_color $fish_color_cwd
  echo
  echo -n (prompt_pwd)

  set_color normal
  echo -n (__fish_git_prompt)

  set_color red
  if test $status = 0
    set_color yellow
  end

  echo
  echo -n '⟩ '
  set_color normal
end
