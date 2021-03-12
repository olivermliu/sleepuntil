#!/bin/bash

until_unix=$(date -d $1 +%s)

err=$?
if [ $err -ne 0 ]; then
  echo "Invalid date format entered. Use ISO format YYYY-MM-DDTHH:MM:SS"
  exit 1
fi

sleep_secs=$((until_unix - $(date +%s)))
if [[ $sleep_secs -lt 0 ]]; then
  echo "Not sleeping. Specified date lies in the past"
  exit 1
fi

sleep_s=$((sleep_secs % 60))
sleep_m=$((sleep_secs / 60 % 60))
sleep_h=$((sleep_secs / (60*60) % 24))
sleep_d=$((sleep_secs / (60*60*24)))
sleep_text="Sleeping for "

if [[ sleep_d -ne 0 ]]; then
  sleep_text=$sleep_text$sleep_d' day(s) '
fi
if [[ sleep_h -ne 0 ]]; then
  sleep_text=$sleep_text$sleep_h' hour(s) '
fi
if [[ sleep_m -ne 0 ]]; then
  sleep_text=$sleep_text$sleep_m' minute(s) '
fi
sleep_text=$sleep_text$sleep_s' second(s) until '$(date -d @$until_unix)

echo $sleep_text
sleep $sleep_secs
exit