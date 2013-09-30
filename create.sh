#!/bin/sh -x

error(){
    echo "$1" 1>&2
    exit 1
}

[ -z "$1" ] && error "Usage: $0 <new_app_name>"

set -e

( cd skeleton; make -s dist-clean; )
APP=`basename "$1"`
APP_UPPER=`echo "$APP" | tr a-z A-Z`
cp --recursive -- skeleton "$1"
find "$1" -type f -exec sed --in-place "s/skeleton/$APP/g" '{}' ';'
find "$1" -type f -exec sed --in-place "s/SKELETON/$APP_UPPER/g" '{}' ';'
cd "$1"
DATE=`LC_ALL=C date '+%d %b %Y'`
YEAR=`date '+%Y'`
for i in include/* src/*; do
    DEST_FILENAME=`echo "$i" | sed "s/skeleton/$APP/g"`
    mv --force -- "$i" "$DEST_FILENAME"
    sed --in-place "s/{{DATE}}/$DATE/g" "$DEST_FILENAME"
    sed --in-place "s/{{YEAR}}/$YEAR/g" "$DEST_FILENAME"
done
echo done

