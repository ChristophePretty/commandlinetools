#!/bin/bash

MINSIZE=200M
FILE=/tmp/filesize.$$.csv
ROOT=$1

if [[ "$ROOT" == "" ]]; then
	ROOT="/"
fi

echo "Looking in $ROOT*"

for d in "$ROOT"*; do
	if [[ -d $d ]]; then
		echo "Working on $d"
		du -h -x -c -t $MINSIZE "$d"  | tee -a "$FILE"
	fi
done

echo ""
echo "Result  !!!"
echo ""

sort -h "$FILE"

rm -rf $FILE || true