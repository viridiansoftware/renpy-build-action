#!/bin/sh

sdk_name=renpy-$1-sdk

echo "Building the project at $2..."
if ../renpy/renpy.sh ../renpy/launcher distribute $2; then
    built_dir=$(ls | grep '\-dists')
    echo ::set-output name=dir::$built_dir
    echo ::set-output name=version::${built_dir%'-dists'}
else
    return 1
fi
