#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 /path/to/vrm-viewer/dist" >&2
  exit 1
fi

SOURCE_DIR="$1"
TARGET_DIR="$(cd "$(dirname "$0")/.." && pwd)/viewer"

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Source dist directory not found: $SOURCE_DIR" >&2
  exit 1
fi

rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"
cp -R "$SOURCE_DIR"/. "$TARGET_DIR"/

echo "Synced viewer build to: $TARGET_DIR"
