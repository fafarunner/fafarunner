#!/bin/zsh

set -e

if [ -f "FaFa Runner.dmg" ]; then
    echo "Delete FaFa Runner.dmg"
    rm -f ./FaFa\ Runner.dmg
fi

pnpm -c -s dlx appdmg ./appdmg.json ./FaFa\ Runner.dmg

exit 0
