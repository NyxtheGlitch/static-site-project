#!/usr/bin/env bash
# Deploy the local site/ folder to the remote server with rsync.
# Usage: ./deploy.sh            (real deploy)
#        ./deploy.sh --dry-run  (preview only, changes nothing)

set -euo pipefail

SERVER="static-site"                  # Host name from ~/.ssh/config
REMOTE_DIR="/var/www/static-site/"    # Where nginx serves files from
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOCAL_DIR="$SCRIPT_DIR/site/"

rsync -avz --delete "$@" "$LOCAL_DIR" "$SERVER:$REMOTE_DIR"


case " $* " in
  *" --dry-run "*) echo "Dry run complete. Nothing was changed." ;;
  *)               echo "Deployed. Visit http://18.219.62.31" ;;
esac
