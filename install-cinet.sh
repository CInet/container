#!/bin/bash

# Every error must halt the installation
set -euo pipefail

for pkg in "$@"; do
  git clone https://github.com/CInet/"$pkg"
  pushd "$pkg"
  dzil authordeps | cpanm
  dzil build
  cpanm "$pkg"*.tar.gz
  popd
done
