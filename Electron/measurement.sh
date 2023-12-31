#!/bin/bash

index="$1"
mic="$2"
cam="$3"
ss="$4"
t="$5"
app="$6"

# Make unique directory for current iteration
folder_name="Iter${index}_${mic}_${cam}_${ss}_${t}_${app}"
mkdir -p ExperimentData/"$folder_name"
cd ExperimentData/"$folder_name"

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

# Run duration in seconds
time=$((t * 60))
echo "Measuring $app_name for $time seconds"

#  Run powerjoular with a timeout
sudo timeout -s SIGINT "$time" powerjoular -l -a "$app_name" -f "powerjoular.csv" &

# Run tshark with interface and duration options
touch tshark.pcap
chmod o=rw tshark.pcap
sudo tshark -q -i "$interface" -a duration:"$time" -w "tshark.pcap" &

# Run ps in a loop with an iterval of 1 second
ps_time=$((time + SECONDS))
echo "timestamp,pid,%mem" > "ps.csv"
while [ $SECONDS -lt $ps_time ]; do
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    sudo ps -C "$app_name" -o pid,%mem --no-headers | tr -s ' ' ',' | sed "s/^/$timestamp/" >> "ps.csv"
    sleep 1
done &

wait


# Get the number of TCP packets captured
tcpCount=$(sudo tshark -r tshark.pcap -Y "tcp" | wc -l)

# Get the number of UDP packets captured
udpCount=$(sudo tshark -r tshark.pcap -Y "udp" | wc -l)


# Create a CSV file and write the header
echo "TCP Packets,UDP Packets,Total Packets" > packet_counts.csv

# Write the packet counts to the CSV file
echo "$tcpCount,$udpCount,$((tcpCount+udpCount))" >> packet_counts.csv

exit 0



