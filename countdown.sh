#!/bin/zsh

echo "Enter a future date (YYYY-MM-DD): "
read future_date

future_epoch=$(date -j -f "%Y-%m-%d" "$future_date" +%s)
midnight_epoch=$((future_epoch + 86400 - 1))
current_epoch=$(date +%s)
time_diff=$((midnight_epoch - current_epoch))

while [ $time_diff -gt 0 ]
do
    days=$((time_diff / 86400))
    hours=$((time_diff % 86400 / 3600))
    minutes=$((time_diff % 3600 / 60))
    seconds=$((time_diff % 60))
    printf "%s: %d days %02d hours %02d mins %02d sec left\n" $future_date $days $hours $minutes $seconds
    sleep 1
    current_epoch=$(date +%s)
    time_diff=$((midnight_epoch - current_epoch))
done

echo "Countdown complete!" | less