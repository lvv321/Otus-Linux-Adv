#!/bin/bash

cd /proc
res=""
CLK_TCK=$(getconf CLK_TCK)

for d in [0-9]*; do
    c=$(cat /proc/$d/cmdline | tr "\0" " ")
    if [[ $c = "" ]]; then
        c="[$(cat /proc/$d/comm)]"
    fi

    s=$(awk 'NR == 3 {print $2$3}' /proc/$d/status)

    pr_stat=($(sed -E 's/\([^)]+\)/X/' "/proc/$d/stat"))
    let p="pr_stat[13]/$CLK_TCK + pr_stat[14]/$CLK_TCK"

    res+=$(echo -e "\n$d:$s:$p:$c")
done

echo "$res" | column -t -s ':' -l 4 -T 4 -R 1,3 -N PID,Status,CPU_Sec,Command | sort -k 1 -h