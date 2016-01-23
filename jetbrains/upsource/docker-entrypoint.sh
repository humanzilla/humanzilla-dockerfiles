#!/bin/bash
set -e

if ! [ -e bin/upsource.sh ]; then
    echo >&2 "Upsource not found in $(pwd) - copying now..."

    if [ "$(ls -A)" ]; then
        echo >&2 "WARNING: $(pwd) is not empty - press Ctrl+C now if this is an error!"
        ( set -x; ls -A; sleep 10 )
    fi

    tar cf - --one-file-system -C /usr/src/upsource . | tar xf -

    echo >&2 "Complete! Upsource has been successfully copied to $(pwd)"
fi

exec "$@"
