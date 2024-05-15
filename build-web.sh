#!/bin/sh

set -e

if [[ "$VERCEL_ENV" == "preview" ]] ; then
  echo "🔥Building web app in preview environment"
  flutter/bin/flutter build web
else
  echo "🔥Building web app in production environment"
  flutter/bin/flutter build web
fi

exit 0
