#!/bin/bash

# Set the desired speed (lower value = faster animation)
# Replace 0.5 with your desired speed
SPEED=0.1

# Change Dock speed for appearing and hiding
defaults write com.apple.dock autohide-time-modifier -float $SPEED

# Restart the Dock to apply changes
killall Dock

echo "Dock animation speed changed to $SPEED seconds."