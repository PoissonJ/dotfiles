# Dotfiles

My personal dotfiles for omarchy and development environments, managed using a bare Git repository.

## 🚀 Quick Setup on New System

```bash
curl -Ls https://raw.githubusercontent.com/poissonj/dotfiles/master/install.sh | bash
```

Then restart your terminal or run `source ~/.bashrc`.

## 📦 Manual Installation

If you prefer to install manually:

```bash
# Clone the repository
git clone --bare https://github.com/poissonj/dotfiles.git $HOME/.cfg

# Set up the config alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Backup existing dotfiles
mkdir -p .config-backup
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}

# Checkout your dotfiles
config checkout
config config --local status.showUntrackedFiles no

# Add alias to shell
echo "alias config='/usr/bin/git --git-dir=\$HOME/.cfg/ --work-tree=\$HOME'" >> ~/.bashrc
```

## 🔧 Daily Usage

Use the `config` command instead of `git` to manage your dotfiles:

### View Status
```bash
config status          # See what files have changed
config diff            # See specific changes
```

### Add New Configuration Files
```bash
config add .vimrc                    # Add a single file
config add .config/newapp/           # Add a directory
config add .config/nvim/init.lua     # Add specific config file
```

### Commit and Push Changes
```bash
config commit -m "Update nvim config"
config push
```

### Pull Latest Changes
```bash
config pull    # Get updates from other machines
```

### Common Workflow
```bash
# After changing configs on your current machine
config add .config/hypr/hyprland.conf
config commit -m "Update Hyprland keybindings"
config push

# On other machines
config pull    # Get the latest changes
```

## 📁 What's Included

This dotfiles repository tracks:

- **Shell Configuration**: `.bashrc`, `.bash_profile`, `.gitconfig`
- **Omarchy/Hyprland**: `.config/omarchy/`, `.config/hypr/`, `.config/waybar/`
- **Development Tools**: `.config/nvim/`, `.config/git/`, `.config/alacritty/`
- **System Utilities**: `.config/btop/`, `.config/fastfetch/`, `.config/mako/`
- **Starship Prompt**: `.config/starship.toml`

## ⚠️ What's NOT Included

Large or sensitive files are excluded:
- Browser configurations (too large, contains cache)
- IDE configurations (machine-specific)
- Application data and caches
- Sensitive files (SSH keys, tokens)

## 🔄 Keeping Multiple Machines in Sync

1. **Make changes on Machine A:**
   ```bash
   config add .config/some-app/config.yaml
   config commit -m "Update some-app config"
   config push
   ```

2. **Update Machine B:**
   ```bash
   config pull
   ```

3. **Handle conflicts** (if any):
   ```bash
   config status          # See conflicted files
   config diff           # Review differences
   # Edit files to resolve conflicts
   config add <resolved-file>
   config commit -m "Resolve config conflicts"
   ```

## 🆘 Troubleshooting

### Restore Backed Up Files
Your original configs are backed up in `~/.config-backup/` during installation.

### Reset to Clean State
```bash
config reset --hard origin/master    # ⚠️ This will lose local changes
```

### Check Repository Status
```bash
config log --oneline -10             # See recent commits
config remote -v                     # Check remote URL
```

### Fix Common Issues
```bash
# If config alias is missing
echo "alias config='/usr/bin/git --git-dir=\$HOME/.cfg/ --work-tree=\$HOME'" >> ~/.bashrc

# If repository is corrupted
rm -rf ~/.cfg
# Then re-run the installation script
```

## 🔗 References

Based on the [Atlassian dotfiles tutorial](https://www.atlassian.com/git/tutorials/dotfiles) using bare Git repositories.