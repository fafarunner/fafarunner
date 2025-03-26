#!/bin/sh

set -e

echo "COMMIT_REF: $COMMIT_REF"
echo "CONTEXT: $CONTEXT"
echo "APP_PREVIEW: $APP_PREVIEW"

if [ "$CONTEXT" = "production" ] ; then
  echo "🔥Building web app in production environment"
  flutter build web --dart-define SENTRY_DSN="$FR_ENV_PROD" --dart-define GIT_COMMIT_SHA="$COMMIT_REF" --dart-define APP_PREVIEW="$APP_PREVIEW"
else
  echo "🔥Building web app in $CONTEXT environment"
  flutter build web --dart-define SENTRY_DSN="$FR_ENV_STG" --dart-define GIT_COMMIT_SHA="$COMMIT_REF" --dart-define APP_PREVIEW="$APP_PREVIEW"
fi

exit 0