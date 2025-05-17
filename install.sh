#!/data/data/com.termux/files/usr/bin/bash

# Update and install dependencies
pkg update -y
pkg install httrack curl jq -y

# Create bin directory in home if it doesn't exist
mkdir -p ~/bin

# Download the clone script
curl -L -o ~/bin/clone https://raw.githubusercontent.com/Zayan-Coder/Website-cloner/refs/heads/main/bin/clone

# Make it executable
chmod +x ~/bin/clone

# Add ~/bin to PATH if not already
if ! grep -q 'export PATH=$HOME/bin:$PATH' ~/.bashrc; then
  echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
fi

# For zsh users too
if [ -f ~/.zshrc ] && ! grep -q 'export PATH=$HOME/bin:$PATH' ~/.zshrc; then
  echo 'export PATH=$HOME/bin:$PATH' >> ~/.zshrc
fi

# Reload the shell environment
source ~/.bashrc 2>/dev/null || source ~/.zshrc 2>/dev/null

echo
echo "✅ Website Cloner installed successfully!"
echo "▶ Type: clone"
