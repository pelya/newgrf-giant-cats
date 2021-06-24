#!/bin/sh

nmlc -c --default-lang=english.lng --grf=Giant_Cats.grf Giant_Cats.nml || exit 1

cp -f *.grf $HOME/.local/share/openttd/newgrf/

