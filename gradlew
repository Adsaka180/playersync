#!/usr/bin/env sh
GRADLE_OPTS="${GRADLE_OPTS:-""} -Xmx1536m"
APP_HOME="$(cd "$(dirname "$0")" && pwd)"
exec java $GRADLE_OPTS -jar "$APP_HOME/gradle/wrapper/gradle-wrapper.jar" "$@"
