#!/usr/bin/env sh
set -eu

SCRIPT_DIR=${0%/*}
if [ "$SCRIPT_DIR" = "$0" ]; then
  SCRIPT_DIR=.
fi
SCRIPT_DIR=$(CDPATH= cd -- "$SCRIPT_DIR" && pwd)
REPOSITORY_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
SOURCE_DIRECTORY="$REPOSITORY_ROOT/pet-terminal"
MANIFEST_SOURCE="$SOURCE_DIRECTORY/pet.json"
SPRITESHEET_SOURCE="$SOURCE_DIRECTORY/spritesheet.webp"

if [ ! -f "$MANIFEST_SOURCE" ]; then
  printf 'Missing package file: %s\n' "$MANIFEST_SOURCE" >&2
  exit 1
fi

if [ ! -f "$SPRITESHEET_SOURCE" ]; then
  printf 'Missing package file: %s\n' "$SPRITESHEET_SOURCE" >&2
  exit 1
fi

CODEX_HOME=${CODEX_HOME:-"$HOME/.codex"}
DESTINATION_DIRECTORY="$CODEX_HOME/pets/kesha-terminal"

mkdir -p "$DESTINATION_DIRECTORY"
cp "$MANIFEST_SOURCE" "$DESTINATION_DIRECTORY/pet.json"
cp "$SPRITESHEET_SOURCE" "$DESTINATION_DIRECTORY/spritesheet.webp"

printf 'Kesha (Terminal) was installed to %s\n' "$DESTINATION_DIRECTORY"
printf 'Open an interactive Codex CLI session, run /pets, and choose Kesha (Terminal).\n'
