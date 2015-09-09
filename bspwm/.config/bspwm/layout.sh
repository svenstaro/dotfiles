#!/bin/bash

while [[ true ]]; do
    format=$1

    layout=$(xkb-switch)

    if [[ ${format} == *"%s"* ]]; then
        echo ${format/"%s"/${layout}}
    else
        echo "${layout}"
    fi

    sleep 2
done
