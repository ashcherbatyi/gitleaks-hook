#!/bin/bash

# Directory where hooks are stored
HOOKS_DIR=".git/hooks"
HOOK_FILE="$HOOKS_DIR/pre-commit"

# Ensure hooks directory exists
mkdir -p "$HOOKS_DIR"

# Download the gitleaks pre-commit hook script
curl -sSfL "https://raw.githubusercontent.com/ashcherbatyi/gitleaks-hook/main/pre-commit" -o "$HOOK_FILE"

# Make the hook executable
chmod +x "$HOOK_FILE"

# Check if the git config option is set to enable gitleaks hook, if not, enable it
if ! git config --bool hooks.gitleaks | grep -q true; then
  echo "Enabling gitleaks hook..."
  git config --bool hooks.gitleaks true
  echo "Gitleaks hook has been enabled."
else
  echo "Gitleaks hook is already enabled."
fi

echo "Git hook installed and configured successfully."
