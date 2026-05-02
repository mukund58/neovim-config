#!/usr/bin/env bash
set -euo pipefail

# Install Neovim config and dependencies for apt/pacman systems.
# Usage: ./setup.sh [--copy] [--no-sync]

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
CONFIG_DIR="$HOME/.config/nvim"
COPY_MODE="false"
RUN_SYNC="true"

for arg in "$@"; do
  case "$arg" in
    --copy) COPY_MODE="true" ;;
    --no-sync) RUN_SYNC="false" ;;
    *)
      echo "Unknown option: $arg" >&2
      echo "Usage: $0 [--copy] [--no-sync]" >&2
      exit 1
      ;;
  esac
done

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

detect_pkg_manager() {
  if command_exists apt-get; then
    echo "apt"
  elif command_exists pacman; then
    echo "pacman"
  else
    echo "unsupported"
  fi
}

install_packages_apt() {
  sudo apt-get update
  sudo apt-get install -y \
    neovim git curl ripgrep fd-find \
    gcc g++ make python3 python3-pip \
    nodejs npm
}

install_packages_pacman() {
  sudo pacman -Syu --noconfirm \
    neovim git curl ripgrep fd \
    base-devel python python-pip \
    nodejs npm
}

install_dependencies() {
  local pm
  pm=$(detect_pkg_manager)
  case "$pm" in
    apt) install_packages_apt ;;
    pacman) install_packages_pacman ;;
    *)
      echo "Unsupported distro. Please install dependencies manually." >&2
      echo "Required: neovim git curl ripgrep fd gcc make python3 nodejs" >&2
      exit 1
      ;;
  esac
}

install_packer() {
  local packer_dir="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
  if [ -d "$packer_dir" ]; then
    return
  fi
  git clone --depth 1 https://github.com/wbthomason/packer.nvim "$packer_dir"
}

backup_existing_config() {
  if [ -e "$CONFIG_DIR" ] && [ ! -L "$CONFIG_DIR" ]; then
    local ts
    ts=$(date +%Y%m%d-%H%M%S)
    mv "$CONFIG_DIR" "${CONFIG_DIR}.bak.${ts}"
  fi
}

install_config() {
  backup_existing_config
  if [ "$COPY_MODE" = "true" ]; then
    mkdir -p "$CONFIG_DIR"
    cp -a "$SCRIPT_DIR"/* "$CONFIG_DIR"/
  else
    ln -sfn "$SCRIPT_DIR" "$CONFIG_DIR"
  fi
}

run_packer_sync() {
  if [ "$RUN_SYNC" = "true" ]; then
    nvim --headless +PackerSync +qa
  fi
}

main() {
  install_dependencies
  install_packer
  install_config
  run_packer_sync
  echo "Done. Launch nvim to finish setup."
}

main
