#!/bin/sh

set -e

rm -rf test
mkdir test
cd test
git init
git commit -m initial --allow-empty

echo "## Heading" >> NEWS.md
echo >> NEWS.md
echo "Old news" >> NEWS.md
git add NEWS.md
git commit -m "old NEWS"

git checkout -b a master
( head -n 2 NEWS.md; echo "a"; echo; tail -n 1 NEWS.md ) > NEWS.md.tmp
mv NEWS.md.tmp NEWS.md
git add NEWS.md
git commit -m "a NEWS"

git checkout -b b master
( head -n 2 NEWS.md; echo "b"; echo; tail -n 1 NEWS.md ) > NEWS.md.tmp
mv NEWS.md.tmp NEWS.md
git add NEWS.md
git commit -m "b NEWS"

git checkout master
git merge a --no-edit
git merge b --no-edit

