#!/usr/bin/env bash

set -euo pipefail

if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo "Usage: $0 /path/to/vrm-viewer/dist [/path/to/her-app/Shared/Resources/WebViewer]" >&2
  exit 1
fi

SOURCE_DIR="$1"
SUPPLEMENTAL_DIR="${2:-}"
TARGET_DIR="$(cd "$(dirname "$0")/.." && pwd)/viewer"

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Source dist directory not found: $SOURCE_DIR" >&2
  exit 1
fi

if [[ -n "$SUPPLEMENTAL_DIR" && ! -d "$SUPPLEMENTAL_DIR" ]]; then
  echo "Supplemental resource directory not found: $SUPPLEMENTAL_DIR" >&2
  exit 1
fi

rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"
cp -R "$SOURCE_DIR"/. "$TARGET_DIR"/

if [[ -n "$SUPPLEMENTAL_DIR" && -d "$SUPPLEMENTAL_DIR/audio" ]]; then
  cp -R "$SUPPLEMENTAL_DIR/audio" "$TARGET_DIR/audio"
fi

echo "Synced viewer build to: $TARGET_DIR"
