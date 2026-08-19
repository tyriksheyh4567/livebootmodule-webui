#!/system/bin/sh

# Save the generated config to the module's working config file.
# This script is meant to be called by the WebUI or manually with root privileges.
# It writes atomically to avoid partially-written config files.

set -eu

MODDIR="${0%/*}"
CONFIG_PATH="$MODDIR/config"
TMP_PATH="${CONFIG_PATH}.tmp"

if [ ! -d "$MODDIR" ] || [ -z "${MODDIR:-}" ]; then
    echo "Invalid module directory" >&2
    exit 1
fi

write_config() {
    tmp="$1"
    if [ -n "$tmp" ]; then
        printf '%s' "$tmp" > "$TMP_PATH"
        mv -f "$TMP_PATH" "$CONFIG_PATH"
        return 0
    fi
    return 1
}

if [ "$#" -gt 0 ]; then
    write_config "$1"
    exit 0
fi

# If called without an argument, try to read ?config=... from the query string
# when the WebUI invokes it via HTTP in a WebUI-compatible environment.
QUERY="${QUERY_STRING:-}"
if [ -n "$QUERY" ]; then
    VALUE="${QUERY#*config=}"
    VALUE="${VALUE%%&*}"
    VALUE="${VALUE//+/ }"
    VALUE="$(printf '%b' "${VALUE//%/\\x}")"
    write_config "$VALUE"
    exit 0
fi

# Fallback: read a pasted config from stdin
cat > "$TMP_PATH"
mv -f "$TMP_PATH" "$CONFIG_PATH"
