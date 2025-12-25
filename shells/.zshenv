# ~/.zshenv
# Runs for every zsh (login, non-login, interactive, scripts)

# Make $path unique
typeset -U path

# Additional paths (prepend safely, no duplicates)
path=(
  $HOME/.local/bin
  $HOME/scripts
  $path
)

# Relocate uv cache dir
# ---------------------
# The uc cache dir needs to be on the Dev drive because it creates hard links.
export UV_CACHE_DIR=/mnt/Dev/.uv_cache
