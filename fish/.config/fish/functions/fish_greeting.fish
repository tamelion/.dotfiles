function fish_greeting
  if test -x /usr/bin/fortune
    fortune firefly -s
  end
end
