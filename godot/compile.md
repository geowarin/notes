#!/usr/bin/env bash

git tag -d last-build
git tag last-build

set -e

scons module_mono_enabled=yes compiledb=yes target=editor
./bin/godot.linuxbsd.editor.x86_64.mono --headless --generate-mono-glue ./modules/mono/glue

#dotnet nuget add source ~/dev/LocalNugetSource --name LocalNugetSource
rm -rf ~/.local/share/godot/mono/GodotNuGetFallbackFolder
mkdir -p ~/.local/share/godot/mono/GodotNuGetFallbackFolder

./modules/mono/build_scripts/build_assemblies.py --godot-output-dir=./bin \
--push-nupkgs-local ~/dev/LocalNugetSource
