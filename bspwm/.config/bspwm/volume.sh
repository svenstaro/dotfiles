#!/bin/bash

while [[ true ]]; do
    format=$1

    if $(ponymix is-muted); then
        muted="off"
    else
        muted="on"
    fi

    volume=$(ponymix get-volume)

    if [[ ${format} == *"%s"* ]]; then
        echo ${format/"%s"/${muted} ${volume}}
    else
        echo "${muted} ${volume}"
    fi

    sleep 1
done
