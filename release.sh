#!/usr/bin/env bash

ROOT_DIR=$(pwd)
TARGET_DIR=$ROOT_DIR/target
rm -rf $TARGET_DIR
mkdir -p $TARGET_DIR
TEMP_DIR=`mktemp -d`
echo Using temp dir $TEMP_DIR
cp __init__.py $TEMP_DIR
cp manifest.json $TEMP_DIR
mkdir $TEMP_DIR/flex_dupe_checking
cp flex_dupe_checking/__init__.py $TEMP_DIR/flex_dupe_checking
pushd $TEMP_DIR
zip -r anki_flex_dupe_checking.zip .
echo Moving package to $TARGET_DIR
mv anki_flex_dupe_checking.zip $TARGET_DIR
popd
rm -rf $TEMP_DIR