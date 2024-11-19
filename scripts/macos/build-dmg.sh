#!/bin/zsh

set -e

test -f FaFa\ Runner.dmg && rm -f FaFa\ Runner.dmg

appdmg ./appdmg.json ./FaFa\ Runner.dmg

exit 0
