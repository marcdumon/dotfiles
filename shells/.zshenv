# Runs for every zsh (login, non-login, interactive, scripts)

# Additional paths
# ----------------
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/scripts:$PATH"

# Relocate uv cache dir
# ---------------------
# The uc cache dir needs to be on the Dev drive because it creates hard links.
export UV_CACHE_DIR=/mnt/Dev/.uv_cache
