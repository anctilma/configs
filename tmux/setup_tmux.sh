#!/bin/bash

# example file for setting up a tmux based development enviroment

if type tmux >/dev/null 2>/dev/null; then
  if [ -n "$TMUX" ]; then
    echo "Already in a tmux session."
  else
    # Session Name
    SESSION_NAME="myproject"

    # Check if the session already exists
    tmux has-session -t $SESSION_NAME 2>/dev/null

    # Capture the exit code of the previous command
    SESSION_EXISTS=$?

    # If the session does not exist, create it
    if [ $SESSION_EXISTS -ne 0 ]; then
      # Start new tmux session
      tmux new-session -d -s $SESSION_NAME

      # Rename first window to 'home'
      tmux rename-window -t 0 'home'
      tmux send-keys -t $SESSION_NAME:home 'cd ~' C-m
      tmux send-keys -t $SESSION_NAME:home 'clear' C-m

      # Create second window named 'code'
      tmux new-window -t $SESSION_NAME -n 'code'
      
      # Create third window named 'test'
      tmux new-window -t $SESSION_NAME -n 'test'

      # # Create fourth window named 'ui'
      tmux new-window -t $SESSION_NAME -n 'ui'
      tmux send-keys -t $SESSION_NAME:ui 'source ~/python_envs/myproject/bin/activate' C-m
      tmux send-keys -t $SESSION_NAME:ui 'clear' C-m

      # Create fifth window named 'data'
      tmux new-window -t $SESSION_NAME -n 'data'
      tmux send-keys -t $SESSION_NAME:data 'cd ~/data' C-m
      tmux send-keys -t $SESSION_NAME:data 'clear' C-m

      # Select code window as default view
      tmux select-window -t $SESSION_NAME:code

      # Attach to the tmux session
      tmux attach-session -t $SESSION_NAME
    else
        echo "Session $SESSION_NAME already exists."
    fi
  fi
else
  echo 'tmux is not installed'
fi

