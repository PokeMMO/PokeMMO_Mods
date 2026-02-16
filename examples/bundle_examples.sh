#!/bin/sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

find "$SCRIPT_DIR" -name "info.xml" -type f | while read -r xml; do
  dir="$(dirname "$xml")"
  name="$(basename "$dir")"
  parent="$(dirname "$dir")"
  (cd "$dir" && TZ=UTC zip -r -X "${SCRIPT_DIR}/${name}.mod" . -x "*/.*" ".*")
done