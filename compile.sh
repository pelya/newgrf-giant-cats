#!/bin/sh

rm -rf generated
mkdir -p generated

cat Giant_Cats-header.nml >> generated/Giant_Cats.autogen.nml

./generate-sprite-layout.py cat_1 14 11 -128 128 >> generated/Giant_Cats.autogen.nml

./generate-sprite-layout.py cat_2 15 14 64 96 >> generated/Giant_Cats.autogen.nml

./generate-sprite-layout.py cat_3 12 12 0 160 >> generated/Giant_Cats.autogen.nml

cat Giant_Cats.nml >> generated/Giant_Cats.autogen.nml

nmlc -c --default-lang=english.lng --grf=Giant_Cats.grf generated/Giant_Cats.autogen.nml || exit 1

cp -f *.grf $HOME/.local/share/openttd/newgrf/

