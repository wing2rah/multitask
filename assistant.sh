#!/bin/bash

# ----------------------------
#  PERSONAL ASSISTANT CLI TOOL
# ----------------------------
VERSION="1.0"
LOG_FILE="assistant.log"
NOTES_FILE="notes.txt"
TODO_FILE="todo.txt"
BACKUP_DIR="backup"
mkdir -p "$BACKUP_DIR"

# COLORS
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

log() {
  echo "$(date +'%Y-%m-%d %H:%M:%S') : $1" >> "$LOG_FILE"
}

print_banner() {
  echo -e "${BLUE}"
  echo "╔═══════════════════════════════════╗"
  echo "║     PERSONAL ASSISTANT CLI       ║"
  echo "╚═══════════════════════════════════╝"
  echo -e "${RESET}"
  echo "Version: $VERSION"
  echo ""
}

main_menu() {
  echo -e "${YELLOW}Main Menu:${RESET}"
  echo "1. Take a Note"
  echo "2. Show Notes"
  echo "3. Manage To-Do"
  echo "4. File Organizer"
  echo "5. System Info"
  echo "6. Internet Speed Test"
  echo "7. Weather Info"
  echo "8. Timer / Reminder"
  echo "9. Backup Files"
  echo "10. Show Logs"
  echo "0. Exit"
  echo ""
  read -p "Enter your choice: " choice
  case $choice in
    1) take_note ;;
    2) show_notes ;;
    3) todo_menu ;;
    4) organize_files ;;
    5) system_info ;;
    6) speed_test ;;
    7) weather_info ;;
    8) timer_reminder ;;
    9) backup_files ;;
    10) show_logs ;;
    0) exit_program ;;
    *) echo "Invalid choice!" && main_menu ;;
  esac
}

take_note() {
  echo ""
  read -p "Enter your note: " note
  echo "$(date): $note" >> "$NOTES_FILE"
  log "Note added"
  echo "Note saved."
  main_menu
}

show_notes() {
  echo ""
  echo "===== Your Notes ====="
  cat "$NOTES_FILE"
  echo ""
  main_menu
}

todo_menu() {
  echo ""
  echo "===== TO-DO Manager ====="
  echo "1. Add To-Do"
  echo "2. Show To-Dos"
  echo "3. Remove To-Do"
  echo "0. Back to Main Menu"
  read -p "Choice: " tchoice
  case $tchoice in
    1)
      read -p "Enter task: " task
      echo "[ ] $task" >> "$TODO_FILE"
      log "To-do added"
      ;;
    2)
      cat "$TODO_FILE"
      ;;
    3)
      nl -w2 -s'. ' "$TODO_FILE"
      read -p "Enter line number to delete: " line
      sed -i "${line}d" "$TODO_FILE"
      log "To-do removed"
      ;;
    0) main_menu ;;
    *) echo "Invalid";;
  esac
  todo_menu
}

organize_files() {
  echo ""
  echo "Organizing files by extension..."
  for file in *.*; do
    ext="${file##*.}"
    mkdir -p "$ext"
    mv "$file" "$ext/" 2>/dev/null
  done
  log "Files organized"
  echo "Done."
  main_menu
}

system_info() {
  echo ""
  echo "===== System Info ====="
  echo "Hostname: $(hostname)"
  echo "User: $(whoami)"
  echo "Uptime: $(uptime -p)"
  echo "Memory: $(free -h | grep Mem)"
  echo "Disk: $(df -h / | tail -1)"
  log "System info shown"
  main_menu
}

speed_test() {
  echo ""
  echo "Internet Speed Test (requires speedtest-cli)..."
  if ! command -v speedtest &>/dev/null; then
    echo "Installing speedtest-cli..."
    pkg install -y python
    pip install speedtest-cli
  fi
  speedtest
  log "Speed test run"
  main_menu
}

weather_info() {
  read -p "Enter city: " city
  echo "Fetching weather for $city..."
  curl -s "wttr.in/$city?0"
  log "Weather checked"
  main_menu
}

timer_reminder() {
  read -p "Set timer for how many seconds? " secs
  read -p "Reminder message: " msg
  echo "Timer started for $secs seconds..."
  sleep "$secs"
  termux-notification --title "⏰ Reminder" --content "$msg" || echo "Reminder: $msg"
  log "Reminder sent"
  main_menu
}

backup_files() {
  echo "Backing up notes and todos..."
  cp "$NOTES_FILE" "$BACKUP_DIR/notes_$(date +%F).txt"
  cp "$TODO_FILE" "$BACKUP_DIR/todo_$(date +%F).txt"
  log "Files backed up"
  echo "Backup done."
  main_menu
}

show_logs() {
  echo "===== Usage Logs ====="
  cat "$LOG_FILE"
  echo ""
  main_menu
}

exit_program() {
  echo -e "${GREEN}Goodbye!${RESET}"
  log "Exited program"
  exit 0
}

# Start Script
print_banner
main_menu
