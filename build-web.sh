#!/bin/sh

set -e

if [[ "$VERCEL_ENV" == "preview" ]] ; then
  echo "🔥Building web app in preview environment"
  flutter/bin/flutter build web --dart-define SENTRY_DSN="$FR_ENV_STG"
else
  echo "🔥Building web app in production environment"
  echo "VERCEL_GIT_COMMIT_SHA: $VERCEL_GIT_COMMIT_SHA"
  COMMIT_COUNT="$(git rev-list --count $VERCEL_GIT_COMMIT_SHA)"
  echo "COMMIT_COUNT: $COMMIT_COUNT"
  flutter/bin/flutter build web --dart-define SENTRY_DSN="$FR_ENV_PROD" --build-number "$COMMIT_COUNT"
fi

exit 0
