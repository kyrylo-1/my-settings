#!/bin/bash

# Associative array of predefined Git configurations
declare -A git_configs

# Add your configurations here
git_configs[1]="User Kyrylo Avramenko|github@kyrylo.info|kyrylo1"
git_configs[2]="Joeh Doe|test@example.com|johndoe"

# Function to switch Git user configuration
switch_git_user() {
  local name=$1
  local email=$2
  local username=$3

  git config --global user.name "$name"
  git config --global user.email "$email"
  git config --global credential.username "$username"
  echo "Switched Git configuration to:"
  echo "Name: $name"
  echo "Email: $email"
  echo "Username: $username"
}

show_current_config() {
  local current_name
  local current_email
  local current_username

  current_name=$(git config --global user.name)
  current_email=$(git config --global user.email)
  current_username=$(git config --global credential.username)

  echo "Current Git configuration:"
  echo "Name: $current_name"
  echo "Email: $current_email"
  echo "Username: $current_username"
}

# Command to switch Git user configuration
git_switch() {
  if [ "$#" -eq 1 ]; then
    local config=${git_configs[$1]}
    if [ -z "$config" ]; then
      echo "Configuration $1 not found!"
      return 1
    fi

    IFS='|' read -r name email username <<< "$config"
    switch_git_user "$name" "$email" "$username"
  elif [ "$#" -eq 3 ]; then
    switch_git_user "$1" "$2" "$3"
  else
    echo "Usage: git_switch <number> or git_switch <user_name> <user_email> <username>"
    show_current_config
    return 1
  fi
}