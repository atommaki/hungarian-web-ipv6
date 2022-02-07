#!/bin/bash

if [ -z "$1" ] || [ ! -f "$1" ]; then
    echo "Missing argument or wrong filename. (RESULT_CSV)" >&2
    exit 1
fi

RESULT_CSV="$1"

. $(dirname $0)/funcs.sh


for i in 20 100 500; do
    n_IPv6_address=$(get_csv_block $i | count_IPv6_address)
    p_IPv6_address=$[n_IPv6_address*100/i]
    n_IPv6_download=$(get_csv_block $i | count_IPv6_working_download)
    p_IPv6_download=$[n_IPv6_download*100/i]
    n_IPv6_DNS=$(get_csv_block $i | count_IPv6_DNS_domain)
    p_IPv6_DNS=$[n_IPv6_DNS*100/i]

    echo "  * A magyar **top${i}** website közül:"
    echo "    * IPv6 címe van: ${p_IPv6_address}% ($n_IPv6_address)"
    echo "    * Oldal letöltés működik IPv6-on: ${p_IPv6_download}% ($n_IPv6_download)"
    echo "    * DNS szerverének van IPv6 címe: ${p_IPv6_DNS}% ($n_IPv6_DNS)"
    echo
done

