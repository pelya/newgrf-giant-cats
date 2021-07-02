#!/bin/sh

rm -rf generated
mkdir -p generated

cat Giant_Cats-header.nml >> generated/Giant_Cats.autogen.nml

./generate-sprite-layout.py cat_1 14 11 -128 128 trees >> generated/Giant_Cats.autogen.nml

./generate-sprite-layout.py cat_2 15 14 64 96 trees >> generated/Giant_Cats.autogen.nml

./generate-sprite-layout.py cat_3 12 12 0 160 trees >> generated/Giant_Cats.autogen.nml

./generate-sprite-layout.py cat_4 15 15 -96 128 trees >> generated/Giant_Cats.autogen.nml

./generate-sprite-layout.py cat_5_1 12 12 128 256 no-trees >> generated/Giant_Cats.autogen.nml
./generate-sprite-layout.py cat_5_2 12 12 128 256 no-trees >> generated/Giant_Cats.autogen.nml
./generate-sprite-layout.py cat_5_3 12 12 128 256 no-trees >> generated/Giant_Cats.autogen.nml
./generate-sprite-layout.py cat_5_4 12 12 128 256 no-trees >> generated/Giant_Cats.autogen.nml
./generate-sprite-layout.py cat_5_5 12 12 128 256 no-trees >> generated/Giant_Cats.autogen.nml

cat Giant_Cats.nml >> generated/Giant_Cats.autogen.nml

nmlc -c --default-lang=english.lng --grf=Giant_Cats.grf generated/Giant_Cats.autogen.nml || exit 1

cp -f *.grf $HOME/.local/share/openttd/newgrf/

