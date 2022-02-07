
has_ipv6_address() {
    if host -t AAAA $1 | grep -q 'has no AAAA record'
        then return 1
        else return 0
    fi
}

domain_exists() {
    host $1 > /dev/null 2>&1
}

page_download_on_ipv6() {
    if wget --connect-timeout=20 --tries=5 --quiet -6 http://$1 -O /dev/null
        then return 0
        else return 1
    fi
}

ns_with_ipv6_address() {
    local ns_with_ipv6_address=0
    local all_ns=0
    for NS in $(host -t NS $1 | awk '{print $NF}'); do
        all_ns=$[all_ns+1]
        if has_ipv6_address $NS; then
            ns_with_ipv6_address=$[ns_with_ipv6_address+1]
        fi
    done
    echo "${all_ns};${ns_with_ipv6_address}"
}

get_csv_block() {
    awk -v n=$1 -F";" '$1 >= 1 && $1 <= n {print}' $RESULT_CSV
}

count_yes(){
    awk -v n=$1 -F";" 'BEGIN {s=0} $n == "yes" { s=s+1 } END {print s}'
}

count_non_zero_num(){
    awk -v n=$1 -F";" 'BEGIN {s=0} $n > 0 { s=s+1 } END {print s}'
}


count_IPv6_address() {
    count_yes 3
}

count_IPv6_working_download() {
    count_yes 4
}

count_IPv6_DNS_domain() {
    count_non_zero_num 6
}

