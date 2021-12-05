#!/usr/bin/env bash

RLANG="$(grep "^#lang " "$@" |sed "s/^#lang \?//g"|tr -d '\n' )"
RPATH="$HOME/.local/lib/r7rs/"
racket -I $RLANG -S $RPATH -if <(sed "/^#lang \?/d" "$@")
