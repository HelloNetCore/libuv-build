#!/usr/bin/env bash

__exec() {
    local cmd=$1
    shift
    $cmd $@
    local exit_code=$?
    if [[ $exit_code != 0 ]]; then
        exit 1
    fi
}

cwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

git submodule update --init

mkdir -p $cwd/obj
pushd $cwd/obj

__exec cmake ../build/
__exec make install
popd

