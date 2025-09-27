#!/bin/bash

# Dotfiles installation script for omarchy
# Usage: curl -Ls https://raw.githubusercontent.com/poissonj/dotfiles/master/install.sh | bash

set -e

echo "🚀 Installing dotfiles..."

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install git first."
    exit 1
fi

# Clone the dotfiles repository as a bare repo
echo "📦 Cloning dotfiles repository..."
if [ -d "$HOME/.cfg" ]; then
    echo "⚠️  .cfg directory already exists. Backing up to .cfg.backup"
    mv "$HOME/.cfg" "$HOME/.cfg.backup.$(date +%Y%m%d-%H%M%S)"
fi

# Your dotfiles repository
DOTFILES_REPO="https://github.com/poissonj/dotfiles.git"
git clone --bare "$DOTFILES_REPO" "$HOME/.cfg"

# Define the config alias function
function config {
   /usr/bin/git --git-dir="$HOME/.cfg/" --work-tree="$HOME" "$@"
}

echo "🔧 Setting up configuration..."

# Backup existing dotfiles if they exist
echo "📋 Backing up existing configuration files..."
mkdir -p "$HOME/.config-backup"

# Check for conflicts and backup conflicting files
if config checkout 2>&1 | grep -E "\s+\." >/dev/null; then
    echo "⚠️  Some configuration files already exist. Backing them up..."
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | while read file; do
        if [ -f "$HOME/$file" ] || [ -d "$HOME/$file" ]; then
            echo "  Backing up: $file"
            mkdir -p "$HOME/.config-backup/$(dirname "$file")" 2>/dev/null || true
            mv "$HOME/$file" "$HOME/.config-backup/$file" 2>/dev/null || true
        fi
    done
fi

# Checkout the dotfiles
echo "✅ Checking out dotfiles..."
config checkout

# Configure the repository to not show untracked files
config config --local status.showUntrackedFiles no

# Add the config alias to shell configuration
echo "🔗 Setting up config alias..."
ALIAS_LINE="alias config='/usr/bin/git --git-dir=\$HOME/.cfg/ --work-tree=\$HOME'"

# Add to .bashrc if it doesn't already exist
if ! grep -q "alias config=" "$HOME/.bashrc" 2>/dev/null; then
    echo "$ALIAS_LINE" >> "$HOME/.bashrc"
    echo "  Added config alias to .bashrc"
fi

# Add to .bash_profile if it exists and doesn't have the alias
if [ -f "$HOME/.bash_profile" ] && ! grep -q "alias config=" "$HOME/.bash_profile" 2>/dev/null; then
    echo "$ALIAS_LINE" >> "$HOME/.bash_profile"
    echo "  Added config alias to .bash_profile"
fi

echo ""
echo "🎉 Dotfiles installation complete!"
echo ""
echo "📝 Next steps:"
echo "   1. Restart your terminal or run: source ~/.bashrc"
echo "   2. Your original configs are backed up in ~/.config-backup/"
echo "   3. Use 'config status' to manage your dotfiles"
echo "   4. Use 'config add <file>' to track new configuration files"
echo "   5. Use 'config commit -m \"message\"' and 'config push' to save changes"
echo ""
echo "🔧 Useful commands:"
echo "   config status          - See what's changed"
echo "   config add <file>      - Track a new file"
echo "   config commit -m 'msg' - Commit changes"
echo "   config push            - Push to remote repository"
echo ""