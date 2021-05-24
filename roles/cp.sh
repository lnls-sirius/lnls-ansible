#!/bin/sh
set -ex
for d in $(ls |grep -v cp); do
    for f in .ansible-lint .yamllint .flake8; do
        rm -vf $d/$f
        ln -s ../../$f $d/$f
    done
done
