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
find "$1" -type f -exec sed --in-place "s/skeleton/$APP/" '{}' ';'
find "$1" -type f -exec sed --in-place "s/SKELETON/$APP_UPPER/" '{}' ';'
cd "$1"
for i in include/* src/*; do
    mv --force -- "$i" `echo "$i" | sed "s/skeleton/$APP/"`
done
echo done

