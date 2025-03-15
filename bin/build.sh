#!/usr/bin/env bash

abspath=`realpath "$0"`
root=`dirname "$(dirname $abspath)"`

docker run --rm --name mhdb-docs -p 4567:4567 \
    -v "$root/source":/srv/slate/source \
    -v "$root/lib":/srv/slate/lib \
    -v "$root/build":/srv/slate/build \
    --mount type=bind,src="$root/config.rb",dst=/srv/slate/config.rb \
    slatedocs/slate build