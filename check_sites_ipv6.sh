#!/bin/bash

. $(dirname $0)/funcs.sh



if [ -z "$1" ] || [ ! -f "$1" ]; then
    echo "Missing argument or wrong filename. (SITE_LIST_FILE)" >&2
    exit 1
fi

SITE_LIST_FILE="$1"

RESULT_OUTPUT=yes
RESULT_OUTPUT_FILE=results/$(basename $SITE_LIST_FILE | sed 's/list/csv/g')

if [ -f ${RESULT_OUTPUT_FILE} ]; then
    echo "Result file already exists, the file won't be updated: ${RESULT_OUTPUT_FILE}"
    RESULT_OUTPUT=no
else
    echo "Result will be written into $RESULT_OUTPUT_FILE."
    echo "# n; site name; has IPv6 address; IPv6 download works; all nameservers; IPv6 nameservers" > $RESULT_OUTPUT_FILE
fi

i=0
ipv6_address_n=0
ipv6_download_n=0
ipv6_ns_n=0

for SITE in $(cat ${SITE_LIST_FILE}); do
    echo -ne "\r$i \t$SITE                  "
    i=$[i+1]
    ipv6_address=no
    ipv6_download=N/A
    ns_status=$(ns_with_ipv6_address $SITE)
    if [ "$(echo $ns_status | grep ';[1-9]')" ]; then
        ipv6_ns_n=$[ipv6_ns_n+1]
    fi
    if ! domain_exists $SITE; then
        echo "Warning! No IPv4 address for $SITE" >&2
    fi
    if has_ipv6_address $SITE; then
        ipv6_address=yes
        ipv6_address_n=$[ipv6_address_n+1]
        ipv6_download=no
        if page_download_on_ipv6 $SITE; then
            ipv6_download=yes
            ipv6_download_n=$[ipv6_download_n+1]
        fi
        echo -e "\r$i \t$SITE \t $ipv6_address \t $ipv6_download \t $ns_status"
    fi
    if [ "$RESULT_OUTPUT" = "yes" ]; then
        echo "$i;$SITE;$ipv6_address;$ipv6_download;$ns_status" >> $RESULT_OUTPUT_FILE
    fi
done

echo
echo "All sites:                        $i"
echo "Sites with IPv6 address:          $ipv6_address_n"
echo "Sites with working IPv6 download: $ipv6_download_n"
echo "Sites with IPv6 nameserver:       $ipv6_ns_n"

