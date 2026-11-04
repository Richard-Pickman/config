#!/usr/bin/env bash

prompt-themes() {
  local theme_name
  local user
  local at
  local machine
  local dir
  local symbol
  mapfile -t themes < <(grep -E '^prompt-theme-[0-9][0-9][0-9]' "$HOME/.config/misc_configuration/bash_themes.txt")
  for theme_str in "${themes[@]}"; do
    IFS=' ' read -r -a theme <<<"$theme_str"
    theme_name="${theme[0]}"
    user="${theme[1]}"
    at="${theme[2]}"
    machine="${theme[3]}"
    dir="${theme[4]}"
    symbol="${theme[5]}"
    printf "\e[38;5;%dm%s" $user "$USER"
    printf "\e[38;5;%dm%s" $at @
    printf "\e[38;5;%dm%s" $machine "$(hostname | sed 's/.local//')"
    printf " \e[38;5;%dm%s" $dir "$(pwd)"
    printf " \e[38;5;%dm%s" $symbol "$"
    echo
  done

  #echo "$user $at $machine $dir $symbol"
}
prompt-themes
exit

prompt-colors-set() {
  local user='\e38;5;'
  local at='\e38;5;'
  local machine='\e38;5;'
  local dir='\e38;5;'
  local symbol='\e38;5;'
  local reset='\e38;5;'

  PROMPT_USER=$TPUT_BRIGHT_MAGENTA
  PROMPT_AT=$TPUT_GREEN
  PROMPT_MACHINE=$TPUT_BRIGHT_MAGENTA
  PROMPT_DIR=$TPUT_BRIGHT_BLUE
  PROMPT_SYMBOL=$TPUT_GREEN
  PROMPT_RESET=$TPUT_RESET
}

printf "\e[38;5;%dmCOLOR %4d " $color $color

for ((i = 0; i <= 255; i += columns)); do
  for ((j = 0; j < columns; j++)); do
    color=$((i + j))
    if [[ $color -gt 255 ]]; then
      break
    fi
    printf "\e[38;5;%dmCOLOR %4d " $color $color
  done
  printf "\n"
done
