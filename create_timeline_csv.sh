#!/bin/bash

. $(dirname $0)/funcs.sh

TIMELINE_CSV=results/timeline.csv

echo "Writing to $TIMELINE_CSV"
echo

{
  echo "# year; month; 20; n (of 20) has IPv6 address; n (of 20) IPv6 download work; n (of 20) has IPV6 DNS server; 100; 100 addr; 100 download; 100 DNS; 500; 500 addr; 500 download; 500 DNS"

  for FILE in $(ls results/20*csv); do
      YEAR_MONTH=$( echo $FILE | awk -F/ '{print $2}' | awk -F. '{print $1}')
      YEAR=$( echo $YEAR_MONTH | awk -F- '{print $1}')
      MONTH=$(echo $YEAR_MONTH | awk -F- '{print $2}')
      echo -n "$YEAR; $MONTH"
      RESULT_CSV=$FILE
      for i in 20 100 500; do
          n_IPv6_address=$(get_csv_block $i | count_IPv6_address)
          p_IPv6_address=$[n_IPv6_address*100/i]
          n_IPv6_download=$(get_csv_block $i | count_IPv6_working_download)
          p_IPv6_download=$[n_IPv6_download*100/i]
          n_IPv6_DNS=$(get_csv_block $i | count_IPv6_DNS_domain)
          p_IPv6_DNS=$[n_IPv6_DNS*100/i]
          echo -n "; $i; $n_IPv6_address; $n_IPv6_download; $n_IPv6_DNS"
      done
      echo
  done
} | tee $TIMELINE_CSV

