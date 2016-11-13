#!/bin/bash
set -e

OVERSION=$(cat VERSION)
NVERSION=$1

echo "Old Version: $OVERSION  New Version: $NVERSION"

VERSION_REPLACEMENT_STRING="s/$OVERSION/$NVERSION/"

FILES_TO_UPDATE="VERSION README.md Dockerfile"

git checkout -b "update_to_$NVERSION"

sed -i '' -e $VERSION_REPLACEMENT_STRING $FILES_TO_UPDATE

git add $FILES_TO_UPDATE

git commit -m "update to $NVERSION"
