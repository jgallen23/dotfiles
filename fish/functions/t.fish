function t
  if test -z "$argv"
    tmux ls
  else
    if test -z "$TMUX"
      tmux at -t $argv;or tmux new -s $argv
    else
      tmux switch-client -t $argv
    end
  end
end
