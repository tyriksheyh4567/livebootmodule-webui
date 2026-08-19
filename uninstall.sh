#!/system/bin/sh
# Minimal uninstall helper — removes module-created caches (only if present)
set -eu

MODDIR="${0%/*}"

# Known external paths the module may create or use. Edit as needed.
CANDIDATES="
/data/cache/liveboot
/data/cache/liveboot-logs
/data/local/tmp/liveboot
"

for p in $CANDIDATES; do
  if [ -e "$p" ]; then
    echo "Removing $p"
    rm -rf "$p"
  fi
done

echo "Uninstall cleanup complete. Note: module folder removal is handled by your module manager."

exit 0
