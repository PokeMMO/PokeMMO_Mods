#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
NEW_REV="${1:?Usage: $0 <new_revision_number>}"

find "$SCRIPT_DIR" -name "info.xml" -type f | while read -r xml; do
  sed -i '' "s/theme_revision=\"[0-9]*\"/theme_revision=\"${NEW_REV}\"/" "$xml"
done