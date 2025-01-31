# ZSH Configuration 
My personal ZSH config setup for linking .zshrc file to version controlled .zshrc.

## Setup Instructions

### 1. Clone the Repository

### 2. Create Symbolic Link

First, check if you already have a .zshrc file:

```zsh
ls -la ~/.zshrc
```

#### If you already have a .zshrc:
```zsh
# Backup your existing .zshrc
mv ~/.zshrc ~/.zshrc.backup

# Create symbolic link
ln -s ~/dev/zsh-config/.zshrc ~/.zshrc
```

#### If you don't have a .zshrc:
```zsh
# Simply create the symbolic link
ln -s ~/dev/zsh-config/.zshrc ~/.zshrc
```

### 3. Source file

```zsh
source ~/.zshrc
```

## Making Changes

You can now edit either `~/.zshrc` or `~/dev/zsh-config/.zshrc`.
