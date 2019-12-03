#!/bin/bash

has_ipv6_address() {
    if host -t AAAA $1 | grep -q 'has no AAAA record'
        then return 1
        else return 0
    fi
}


if [ -z "$1" ] || [ ! -f "toppages/$1" ]; then
    echo "Missing argument or wrong filename" >&2
    exit 1
fi

PAGES_FILE="$1"

if [ -f results/${PAGES_FILE} ]; then
    echo "Result file already exists: results/${PAGES_FILE}"
    exit 1
fi

i=0
n=0
for PAGE in $(cat toppages/${PAGES_FILE}); do
    i=$[i+1]
    if has_ipv6_address $PAGE
        then ipv6_status=yes; n=$[n+1]
        else ipv6_status=no
    fi
    echo "$i;$PAGE;$ipv6_status" >> results/${PAGES_FILE}
done

echo "$i/$n"

