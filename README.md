# My Personal Dotfiles & Scripts Repository

This repository centralizes personal configuration files (dotfiles) and custom scripts to simplify setup and management across multiple systems. It includes an installer script to automatically create symbolic links to the appropriate locations.

## Purpose

- Maintain a single source of truth for shell configurations, editor settings, fonts, and scripts.  
- Simplify system setup and portability.  
- Enable version control for personal environment customizations.  

## Contents

- **Dotfiles**: Shell configs (`.bashrc`, `.zshrc`, `.profile`), editor settings (`.nanorc`), fonts, and other configuration files.  
- **Scripts**: Utility scripts for daily workflow and system tweaks.  
- **Installer**: Python script to create symlinks from the repository to the home directory or custom paths.  

## Future Improvements

- Move file mappings to a **TOML configuration** for easier management.  
- Add **backup & force options** to handle existing files.   
- Add **interactive mode** for conflict resolution.  
- Improve **logging & error handling** for missing sources or permission issues.  

## Usage

```bash
python3 install_dotfiles.py
```
## Repository Structure
```
~/my_repo/
├── dotfiles/       # Configuration files
├── scripts/        # Utility scripts
install_dotfiles.py  # Symlink installer
```
