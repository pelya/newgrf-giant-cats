#!/bin/sh

rm -f Giant_Cats.autogen.nml

cat Giant_Cats_header.nml >> Giant_Cats.autogen.nml

./generate-sprite-layout.py cat_1 >> Giant_Cats.autogen.nml

cat Giant_Cats_footer.nml >> Giant_Cats.autogen.nml

nmlc -c --default-lang=english.lng --grf=Giant_Cats.grf Giant_Cats.autogen.nml || exit 1

cp -f *.grf $HOME/.local/share/openttd/newgrf/

