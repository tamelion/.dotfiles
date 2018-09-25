# git prompt
set __fish_git_prompt_show_informative_status true
set __fish_git_prompt_showcolorhints true

# full length pwd
set fish_prompt_pwd_dir_length 0

# abbreviations
if not set -q abbrs_initialized
  set -U abbrs_initialized
  echo -n Setting abbreviations... 

  abbr t 'tmux new-session -A -s general'
  abbr r 'ranger'
  abbr dc 'docker-compose'

  echo 'Done'
end

