#!/usr/bin/env zsh

set -e -o verbose

mdbook build

DIR=book/pandoc/epub
BOOK='The Rust Programming Language.epub'
META=meta.opf

pushd $DIR

epubmeta --export=$META "$BOOK"
sed -i "/<\/dc:language>/r ../../../$META" $META
epubmeta --import=$META "$BOOK"

kepubify --inplace --output $DIR "$BOOK"

popd

