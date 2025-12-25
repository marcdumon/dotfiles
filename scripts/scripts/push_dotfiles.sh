#!/usr/bin/env bash
set -e

cd /home/md/dotfiles
read -p 'Commit message: ' msg
git add .
git commit -m "$msg" || true
git push -u origin main
