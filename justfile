set shell := ["sh", "-c"]
set windows-shell := ["powershell", "-c"]

compile:
    esphome compile mcp23017.yaml

copy:
	@python copy.py

zig:
    zig build

wat:
    wasm2wat chip.wasm

#version needs to be in form v0.0.1
release version:
    git tag {{ version }}
    git push origin {{ version }}

delete_release version:
    git tag -d {{ version }}
    git push origin --delete {{ version }}
