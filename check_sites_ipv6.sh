#!/bin/bash

has_ipv6_address() {
    if host -t AAAA $1 | grep -q 'has no AAAA record'
        then return 1
        else return 0
    fi
}

page_download_on_ipv6() {
    if wget --quiet -6 http://$1 -O /dev/null
        then return 0
        else return 1
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
ipv6_address_n=0
ipv6_download_n=0

for PAGE in $(cat toppages/${PAGES_FILE}); do
    i=$[i+1]
    ipv6_address=no
    ipv6_download=no
    if has_ipv6_address $PAGE; then
        ipv6_address=yes
        ipv6_address_n=$[ipv6_address_n+1]
        if page_download_on_ipv6 $PAGE; then
            ipv6_download=yes
            ipv6_download_n=$[ipv6_download_n+1]
        fi
    fi
    echo "$i;$PAGE;$ipv6_address;$ipv6_download" >> results/${PAGES_FILE}
done

echo "All sites:                        $i"
echo "Sites with IPv6 address:          $ipv6_address_n"
echo "Sites with working IPv6 download: $ipv6_download_n"

