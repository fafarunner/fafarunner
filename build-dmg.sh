#!/bin/zsh

set -e

if [ -f "FaFaRunner.dmg" ]; then
    echo "Delete FaFaRunner.dmg"
    rm -f ./FaFaRunner.dmg
fi

pnpm -c -s dlx appdmg ./appdmg.json ./FaFaRunner.dmg

exit 0
