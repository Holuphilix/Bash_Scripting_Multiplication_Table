#!/usr/bin/bash

# Prompt the user for a number
read -p "Enter a number for the multiplication table: " num

# Ask the user if they want a full or partial table
read -p "Do you want a full table or a partial table? (Enter 'f' for full, 'p' for partial): " choice

# Function to display the multiplication table in ascending or descending order
display_table() {
  local start=$1
  local end=$2
  local step=$3
  local order_text=$4

  echo "Multiplication Table for $num ($order_text):"
  for ((i=start; i!=end+step; i+=step)); do
    echo "$num x $i = $((num * i))"
  done
}

# Ask user for order preference
read -p "Do you want the table in ascending or descending order? (a/d): " order

if [ "$choice" == "f" ]; then
  # Full multiplication table
  if [ "$order" == "a" ]; then
    display_table 1 10 1 "Ascending"
  elif [ "$order" == "d" ]; then
    display_table 10 1 -1 "Descending"
  else
    echo "Invalid choice! Please enter 'a' or 'd'."
  fi
elif [ "$choice" == "p" ]; then
  # Partial multiplication table
  read -p "Enter the starting number (between 1 and 10): " start
  read -p "Enter the ending number (between 1 and 10): " end

  # Validate the input range
  if ((start >= 1 && start <= 10 && end >= 1 && end <= 10)); then
    if [ "$order" == "a" ]; then
      if ((start <= end)); then
        display_table "$start" "$end" 1 "Ascending"
      else
        echo "Invalid range! Start should be less than or equal to End for ascending order."
      fi
    elif [ "$order" == "d" ]; then
      if ((start >= end)); then
        display_table "$start" "$end" -1 "Descending"
      else
        echo "Invalid range! Start should be greater than or equal to End for descending order."
      fi
    else
      echo "Invalid choice! Please enter 'a' or 'd'."
    fi
  else
    echo "Invalid range! Ensure both numbers are between 1 and 10."
  fi
else
  echo "Invalid choice! Please enter 'f' or 'p'."
fi
