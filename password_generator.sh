#!/bin/bash

clear_screen() {
  clear
}

print_banner() {
  echo -e "\e[36m╔══════════════════════════════════════════════════════════╗"
  echo -e "║                                                          ║"
  echo -e "║  \e[33m██████╗  █████╗ ███████╗███████╗██╗    ██╗ ██████╗ ██████╗ ██████╗\e[36m  ║"
  echo -e "║  \e[33m██╔══██╗██╔══██╗██╔════╝██╔════╝██║    ██║██╔═══██╗██╔══██╗██╔══██╗\e[36m ║"
  echo -e "║  \e[33m██████╔╝███████║███████╗███████╗██║ █╗ ██║██║   ██║██████╔╝██║  ██║\e[36m ║"
  echo -e "║  \e[33m██╔═══╝ ██╔══██║╚════██║╚════██║██║███╗██║██║   ██║██╔══██╗██║  ██║\e[36m ║"
  echo -e "║  \e[33m██║     ██║  ██║███████║███████║╚███╔███╔╝╚██████╔╝██║  ██║██████╔╝\e[36m ║"
  echo -e "║  \e[33m╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝ \e[36m ║"
  echo -e "║                                                          ║"
  echo -e "║  \e[32m██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ████████╗ ██████╗ ██████╗\e[36m ║"
  echo -e "║  \e[32m██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗\e[36m║"
  echo -e "║  \e[32m██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║   ██║   ██║   ██║██████╔╝\e[36m║"
  echo -e "║  \e[32m██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║   ██║   ██║   ██║██╔══██╗\e[36m║"
  echo -e "║  \e[32m╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║   ██║   ╚██████╔╝██║  ██║\e[36m║"
  echo -e "║  \e[32m╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝\e[36m║"
  echo -e "║                                                          ║"
  echo -e "╚══════════════════════════════════════════════════════════╝\e[0m"
  echo -e "\e[35m     Created by: \e[37mAbderrafie     \e[34mGitHub: \e[37mgithub.com/aabderrafie\e[0m"
  echo -e "\e[36m══════════════════════════════════════════════════════════════\e[0m"
}

# Generate a strong password of specified length
generate_password() {
  local length=$1
  local password=""
  local uppercase_letters="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  local lowercase_letters="abcdefghijklmnopqrstuvwxyz"
  local digits="0123456789"
  local special_chars="!@#$%^&*()-_=+[]{}|;:,.<>?/"
  local all_chars="${uppercase_letters}${lowercase_letters}${digits}${special_chars}"
  
  # Ensure the password has at least one character from each set
  local up_char="${uppercase_letters:$(( RANDOM % ${#uppercase_letters} )):1}"
  local low_char="${lowercase_letters:$(( RANDOM % ${#lowercase_letters} )):1}"
  local dig_char="${digits:$(( RANDOM % ${#digits} )):1}"
  local spec_char="${special_chars:$(( RANDOM % ${#special_chars} )):1}"
  
  password="${up_char}${low_char}${dig_char}${spec_char}"
  
  # Fill the rest of the password with random characters
  for ((i=4; i<length; i++)); do
    local rand_index=$(( RANDOM % ${#all_chars} ))
    password="${password}${all_chars:$rand_index:1}"
  done
  
  # Shuffle the password (using Fisher-Yates algorithm in bash)
  local shuffled=""
  local -a pass_array=()
  
  # Convert password string to array
  for ((i=0; i<${#password}; i++)); do
    pass_array[$i]="${password:$i:1}"
  done
  
  # Shuffle the array
  for ((i=${#pass_array[@]}-1; i>0; i--)); do
    local j=$(( RANDOM % (i+1) ))
    local temp="${pass_array[$i]}"
    pass_array[$i]="${pass_array[$j]}"
    pass_array[$j]="$temp"
  done
  
  # Convert array back to string
  for ((i=0; i<${#pass_array[@]}; i++)); do
    shuffled="${shuffled}${pass_array[$i]}"
  done
  
  echo "$shuffled"
}

# Display an animated loading effect
animate_loading() {
  echo -e "\n\e[33mGenerating secure password\c"
  for ((i=0; i<5; i++)); do
    sleep 0.3
    echo -e ".\c"
  done
  echo -e "\n"
}

# Display a visual indicator of password strength
display_password_strength() {
  local length=$1
  
  if [ "$length" -lt 8 ]; then
    local strength="\e[31mWeak"
    local bar="\e[31m[██        ]"
  elif [ "$length" -lt 12 ]; then
    local strength="\e[33mMedium"
    local bar="\e[33m[█████     ]"
  elif [ "$length" -lt 16 ]; then
    local strength="\e[32mStrong"
    local bar="\e[32m[████████  ]"
  else
    local strength="\e[36mVery Strong"
    local bar="\e[36m[██████████]"
  fi
  
  echo -e "\e[37mPassword Strength: $strength"
  echo -e "Security Level: $bar\e[0m"
}

# Main function
main() {
  clear_screen
  print_banner
  
  echo -e "\n\e[37;1mEnter password length \e[36m(minimum 8 recommended)\e[37m: \c"
  read length
  
  # Validate input
  if ! [[ "$length" =~ ^[0-9]+$ ]]; then
    echo -e "\n\e[31;1mPlease enter a valid number for the password length.\e[0m"
    exit 1
  fi
  
  if [ "$length" -lt 4 ]; then
    echo -e "\n\e[31;1mPassword length must be at least 4 characters to include all character types.\e[0m"
    exit 1
  fi
  
  animate_loading
  password=$(generate_password "$length")
  
  echo -e "\e[36;1m╔═══════════════════ YOUR PASSWORD ═══════════════════╗"
  echo -e "║                                                      ║"
  
  # Center the password in the display box
  padding=$(( (52 - ${#password}) / 2 ))
  spaces_after=$(( 52 - padding - ${#password} ))
  
  printf "\e[36;1m║%${padding}s\e[37;1m%s%${spaces_after}s\e[36;1m║\n" "" "$password" ""
  
  echo -e "║                                                      ║"
  echo -e "╚══════════════════════════════════════════════════════╝\e[0m"
  
  # Display password strength
  display_password_strength "$length"
  
  echo -e "\n\e[33;1mRemember to store your password securely!"
  echo -e "Never share your password with anyone!\e[0m"
}

# Run the main function
main