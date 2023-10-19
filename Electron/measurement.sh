#!/bin/bash

mic="$1"
cam="$2"
ss="$3"
t="$4"
app="$5"

folder_name="${mic}_${cam}_${ss}_${t}_${app}"
mkdir -p ExperimentData/"$folder_name"
cd ExperimentData/"$folder_name"

echo "mic: $mic"
echo "cam: $cam"
echo "ss: $ss"
echo "t: $t"
echo "app: $app"

# Map app value to app name
if [ "$app" -eq 1 ]; then
    app_name="skypeforlinux"
elif [ "$app" -eq 2 ]; then
    app_name="slack"
elif [ "$app" -eq 3 ]; then
    app_name="Discord"
else
    echo "Invalid app value. Exiting script."
    exit 1
fi

# Find the main ethernet interface
interface=$(ip route | awk '/default/ {print $5}')

time=$((t * 5))
echo "Measuring $app_name for $time seconds"

ps_time=$((time + SECONDS))

touch tshark.pcap
chmod o=rw tshark.pcap
echo "timestamp,pid,%mem" > "ps.csv"


sudo timeout -s SIGINT "$time" powerjoular -l -a "$app_name" -f "powerjoular.csv" &
sudo tshark -i "$interface" -a duration:"$time" -w "tshark.pcap" &
while [ $SECONDS -lt $ps_time ]; do
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    sudo ps -C "$app_name" -o pid,%mem --no-headers | tr -s ' ' ',' | sed "s/^/$timestamp/" >> "ps.csv"
    sleep 1
done &

wait

exit 0



