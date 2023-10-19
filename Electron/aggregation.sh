#!/bin/bash

if [ -z "$1" ]
    then
        echo "No folder name provided. Exiting..."
        exit 1
fi

folderName=$1
echo "Reading folder $folderName"

cd "ExperimentData/$folderName"

# Get the number of TCP packets captured
tcpCount=$(sudo tshark -r tshark.pcap -Y "tcp" | wc -l)

# Get the number of UDP packets captured
udpCount=$(sudo tshark -r tshark.pcap -Y "udp" | wc -l)


# Create a CSV file and write the header
echo "TCP Packets,UDP Packets,Total Packets" > packet_counts.csv

# Write the packet counts to the CSV file
echo "$tcpCount,$udpCount,$((tcpCount+udpCount))" >> packet_counts.csv


