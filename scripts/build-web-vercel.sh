#!/bin/sh

set -e

echo "VERCEL_GIT_COMMIT_SHA: $VERCEL_GIT_COMMIT_SHA"
echo "VERCEL_ENV: $VERCEL_ENV"

if [ "$VERCEL_ENV" = "production" ] ; then
  echo "🔥Building web app in production environment"
  flutter/bin/flutter build web --dart-define SENTRY_DSN="$FR_ENV_PROD" --dart-define GIT_COMMIT_SHA="$VERCEL_GIT_COMMIT_SHA" --base-href /play/
else
  echo "🔥Building web app in $VERCEL_ENV environment"
  flutter/bin/flutter build web --dart-define SENTRY_DSN="$FR_ENV_STG" --dart-define GIT_COMMIT_SHA="$VERCEL_GIT_COMMIT_SHA"
fi

exit 0
