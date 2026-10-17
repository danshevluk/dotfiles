#!/usr/bin/env bash
# Symlink tracked configs from this repo into $HOME.
#
# The repo mirrors $HOME, so each entry in LINKS is a path relative to both:
# ~/dotfiles/<path> is linked to ~/<path>. Existing files are moved aside to
# <path>.backup-<timestamp> before linking. Safe to re-run.
#
# Usage: ./install.sh [--dry-run]

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STAMP="$(date +%Y%m%d-%H%M%S)"
DRY_RUN=0
[[ "${1:-}" == "--dry-run" ]] && DRY_RUN=1

# Link individual files rather than whole directories when the app also keeps
# runtime state (logs, sockets, sessions) next to its config.
LINKS=(
  .gitconfig
  .config/git/ignore
  .config/herdr/config.toml
  .config/mise/config.toml
  .config/nvim
  .config/zed/settings.json
  .claude/settings.json
)

run() {
  if (( DRY_RUN )); then
    echo "  would run: $*"
  else
    "$@"
  fi
}

for path in "${LINKS[@]}"; do
  src="$DOTFILES/$path"
  dest="$HOME/$path"

  if [[ ! -e "$src" ]]; then
    echo "skip     $path (missing in repo)"
    continue
  fi

  if [[ -L "$dest" && "$(readlink "$dest")" == "$src" ]]; then
    echo "ok       $path"
    continue
  fi

  run mkdir -p "$(dirname "$dest")"

  if [[ -e "$dest" || -L "$dest" ]]; then
    echo "backup   $path -> $path.backup-$STAMP"
    run mv "$dest" "$dest.backup-$STAMP"
  fi

  echo "link     $path"
  run ln -s "$src" "$dest"
done

# mise resolves the symlink and refuses configs outside ~/.config/mise
# unless they're explicitly trusted.
if command -v mise >/dev/null; then
  echo "trust    .config/mise/config.toml"
  run mise trust --quiet "$DOTFILES/.config/mise/config.toml"
fi
