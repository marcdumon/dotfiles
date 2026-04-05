#!/usr/bin/env bash
# Claude Code status line - styled after Powerlevel10k lean 8-color prompt
# Two-line layout matching the p10k theme in ~/.p10k.zsh

input=$(cat)

cwd=$(echo "$input"      | jq -r '.workspace.current_dir // .cwd // "?"')
model=$(echo "$input"    | jq -r '.model.display_name // "Claude"')
used=$(echo "$input"     | jq -r '.context_window.used_percentage // empty')
session=$(echo "$input"  | jq -r '.session_name // empty')

# --- Directory: replace $HOME with ~ ---
home="$HOME"
display_dir="${cwd/#$home/~}"

# --- Git branch (skip optional locks to avoid blocking) ---
git_branch=""
if git -C "$cwd" rev-parse --is-inside-work-tree --no-optional-locks >/dev/null 2>&1; then
    git_branch=$(git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null \
                 || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
fi

# --- Context usage indicator ---
ctx_info=""
if [ -n "$used" ]; then
    used_int=$(printf "%.0f" "$used")
    ctx_info=" ctx:${used_int}%"
fi

# --- Session name ---
session_info=""
if [ -n "$session" ]; then
    session_info=" [${session}]"
fi

# ANSI color helpers (8-color, matching p10k lean_8colors)
green="\033[0;32m"   # color 2 – frame, git branch
blue="\033[0;34m"    # color 4 – directory
cyan="\033[0;36m"    # color 6 – model name
dim="\033[2m"        # dimmed  – secondary info
reset="\033[0m"

# --- Linux Nerd Font OS icon (Ubuntu/Debian  nf-linux-ubuntu) ---
os_icon=" "

# Line 1: ╭─ <os_icon> <dir> [git branch] <model><session><ctx>
printf "%b╭─%b %s%b%s%b" "$green" "$reset" "$os_icon" "$blue" "$display_dir" "$reset"

if [ -n "$git_branch" ]; then
    printf "  %b%s%b" "$green" "$git_branch" "$reset"
fi

printf "  %b%s%b%b%s%s%b\n" "$cyan" "$model" "$reset" "$dim" "$session_info" "$ctx_info" "$reset"

# Line 2: ╰─
printf "%b╰─%b" "$green" "$reset"
