#!/usr/bin/env zsh

set -e -o verbose

mdbook build
pushd book/epub
kepubify --inplace 'The Rust Programming Language.epub'
popd

