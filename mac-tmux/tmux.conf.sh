#!/bin/sh

# Linux
if [[ "$OSTYPE" == "linux"* ]]; then
  tmux set-option -s set-clipboard off # disbale setting clipboard using osc
  tmux bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel "xclip -i -sel c -f | xclip -i -sel p > /dev/null"
  tmux bind-key -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel "xclip -i -sel c -f | xclip -i -sel p > /dev/null"
fi

# Mac OS X
if [[ "$OSTYPE" == "darwin"* ]]; then
  tmux set-option -s set-clipboard off # disbale setting clipboard using osc
  tmux bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel "pbcopy"
  tmux bind-key -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel "pbcopy"
fi

