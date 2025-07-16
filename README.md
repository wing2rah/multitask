# Personal Assistant CLI Tool

A comprehensive command-line personal assistant tool built in Bash that helps you manage notes, to-dos, files, and system information all in one place.

## 🚀 Features

- **📝 Notes Management**: Take and view personal notes with timestamps
- **✅ To-Do Manager**: Add, view, and remove tasks from your to-do list
- **📁 File Organizer**: Automatically organize files by their extensions
- **💻 System Information**: Display hostname, user, uptime, memory, and disk usage
- **🌐 Internet Speed Test**: Check your internet connection speed
- **🌤️ Weather Information**: Get weather updates for any city
- **⏰ Timer & Reminders**: Set timers with custom reminder messages
- **💾 Backup System**: Backup your notes and to-dos with timestamps
- **📊 Activity Logs**: Track all your activities with detailed logs

## 📋 Prerequisites

- **Bash Shell** (Linux/macOS/Windows with WSL)
- **curl** (for weather information)
- **Internet connection** (for weather and speed test features)

### Optional Dependencies
- **speedtest-cli** (automatically installed when needed)
- **termux-notification** (for Android/Termux users)

## 🛠️ Installation

### Method 1: Quick Install
```bash
# Clone or download the script
wget https://raw.githubusercontent.com/yourusername/personal-assistant-cli/main/assistant.sh

# Make it executable
chmod +x assistant.sh

# Run the script
./assistant.sh
```

### Method 2: Manual Installation
1. **Download the script**
   ```bash
   curl -O https://raw.githubusercontent.com/yourusername/personal-assistant-cli/main/assistant.sh
   ```

2. **Make it executable**
   ```bash
   chmod +x assistant.sh
   ```

3. **Optional: Add to PATH for global access**
   ```bash
   sudo mv assistant.sh /usr/local/bin/assistant
   ```
   Now you can run it from anywhere using `assistant`

### For Termux Users (Android)
```bash
# Update packages
pkg update && pkg upgrade

# Install required packages
pkg install curl python

# Download and setup the script
curl -O https://raw.githubusercontent.com/yourusername/personal-assistant-cli/main/assistant.sh
chmod +x assistant.sh
./assistant.sh
```

## 🎮 Usage

Run the script and navigate through the interactive menu:

```bash
./assistant.sh
```

### Main Menu Options:

1. **Take a Note** - Add timestamped notes
2. **Show Notes** - View all saved notes
3. **Manage To-Do** - Add, view, or remove tasks
4. **File Organizer** - Organize files by extension
5. **System Info** - Display system information
6. **Internet Speed Test** - Check connection speed
7. **Weather Info** - Get weather for any city
8. **Timer/Reminder** - Set timers with custom messages
9. **Backup Files** - Backup notes and to-dos
10. **Show Logs** - View activity logs
0. **Exit** - Close the application

## 📁 File Structure

The script creates the following files and directories:

```
├── assistant.sh          # Main script file
├── notes.txt            # Your personal notes
├── todo.txt             # Your to-do list
├── assistant.log        # Activity logs
└── backup/              # Backup directory
    ├── notes_YYYY-MM-DD.txt
    └── todo_YYYY-MM-DD.txt
```

## ⚙️ Configuration

### Customizing Colors
Edit the color variables in the script:
```bash
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"
```

### Changing File Locations
Modify these variables at the top of the script:
```bash
LOG_FILE="assistant.log"
NOTES_FILE="notes.txt"
TODO_FILE="todo.txt"
BACKUP_DIR="backup"
```

## 🔧 Troubleshooting

### Common Issues

**Speed Test Not Working**
- The script will automatically install `speedtest-cli` if not found
- Ensure you have Python and pip installed
- For Termux: `pkg install python`

**Weather Not Loading**
- Check your internet connection
- Ensure `curl` is installed: `sudo apt install curl` (Ubuntu/Debian)

**File Organization Issues**
- Make sure you're in the correct directory
- The script moves files with extensions to folders named after their extensions

**Permission Denied**
```bash
chmod +x assistant.sh
```

## 📱 Mobile Usage (Termux)

For Android users using Termux:

1. Install Termux from F-Droid or Google Play Store
2. Follow the Termux installation steps above
3. The notification feature will work natively in Termux

## 🤝 Contributing

Feel free to contribute to this project! Here's how:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 🐛 Bug Reports

If you encounter any bugs, please create an issue with:
- Your operating system
- Bash version (`bash --version`)
- Error message (if any)
- Steps to reproduce

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**RAHUL SHAH**
- GitHub: [@wing2rah](https://github.com/wing2rah)
- Email: hi@wing2rah.com

## 🙏 Acknowledgments

- Thanks to the open-source community for inspiration
- Weather data powered by [wttr.in](https://wttr.in/)
- Speed test functionality using [speedtest-cli](https://github.com/sivel/speedtest-cli)

## 📈 Version History

- **v1.0** - Initial release with core functionality
  - Notes management
  - To-do list
  - File organization
  - System information
  - Weather and speed test
  - Timer and backup features

---

⭐ **Star this repository if you found it helpful!**

📞 **Need help?** Open an issue or contact the maintainer.
