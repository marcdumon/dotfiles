#!/usr/bin/env python3

"""
Install script to create symlinks for dotfiles and scripts.
"""

from pathlib import Path


home_dir = Path.home()
my_script_dir = home_dir / "my_scripts"
dotfiles_dir = home_dir / "my_repo" / "dotfiles"
scripts_dir = home_dir / "my_repo" / "scripts"


def create_symlink(source: Path, target: Path, force: bool = False) -> bool:
    target.symlink_to(source)
    print(f"Created symlink: {target} -> {source}")
    return True


def main(files):
    for source_dir, file, dest_dir in files:
        print()
        print(f"Creating symlink: {source_dir / file} -> {dest_dir / file}")

        # Check if source missing
        if not (source_dir / file).exists():
            print(f"Source file {source_dir / file} does not exist")
            continue

        # Check if dest file exists
        if (dest_dir / file).exists():
            print(f"Dest file {dest_dir / file} already exists")
            # Check if simlink ->  nothing
            # if not -> rename .bak
            continue

        # Create symlink
        try:
            create_symlink(source_dir / file, dest_dir / f"{file}")
        except Exception as e:
            print(f"Error: {e}")
            print(
                f"Failed to create symlink {source_dir / file} -> {dest_dir / f'{file}'}"
            )


if __name__ == "__main__":
    files = [
        # Source dir, filename, target dir
        (scripts_dir, "print_color_nrs.sh", my_script_dir),
        (scripts_dir, "toggle_theme.sh", my_script_dir),
        (dotfiles_dir, ".bashrc", home_dir),
        (dotfiles_dir, ".fonts.conf", home_dir),
        (dotfiles_dir, ".profile", home_dir),
        (dotfiles_dir, ".zlogin", home_dir),
        (dotfiles_dir, ".zprofile", home_dir),
        (dotfiles_dir, ".zshenv", home_dir),
        (dotfiles_dir, ".zshrc", home_dir),
        (dotfiles_dir / "nano", "nanorc", home_dir / ".config" / "nano"),
    ]

    main(files)
