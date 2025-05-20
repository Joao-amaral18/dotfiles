#!/bin/bash

# Get the current keyboard layout
current_layout=$(hyprctl getoption input:kb_layout -j | jq -r '.str')

# Toggle between layouts
if [ "$current_layout" = "us" ]; then
    hyprctl keyword input:kb_layout br
    echo "BR"
else
    hyprctl keyword input:kb_layout us
    echo "US"
fi