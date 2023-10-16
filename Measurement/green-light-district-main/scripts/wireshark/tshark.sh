# !/bin/bash


# # Check if the application name is provided as an argument
# if [ "$#" -ne 1 ]; then
#   echo "Usage: $0 <application_name>"
#   exit 1
# fi

# application_name="$1"

# # Find all PIDs of the application
# pids=($(pgrep "$application_name"))

# if [ ${#pids[@]} -eq 0 ]; then
#   echo "No instances of $application_name found or not running."
#   exit 1
# fi

# # Iterate through the list of PIDs and capture packets for each instance
# for pid in "${pids[@]}"; do
#   lsof_info=$(lsof -i -n -P -p "$pid" | grep -E 'TCP|UDP')
#   if [ -z "$lsof_info" ]; then
#     echo "No network connections found for $application_name (PID: $pid)."
#   else
#     # Extract IP address and port from lsof output
#     src_ip_port=$(echo "$lsof_info" | awk '$9 ~ /->/ {print $9}' | cut -d'-' -f1)
#     dest_ip_port=$(echo "$lsof_info" | awk '$9 ~ /->/ {print $10}')

#     src_ip=($(echo "$src_ip_port" | cut -d':' -f1))
#     src_port=($(echo "$src_ip_port" | cut -d':' -f2))

#     # dest_ip=$(echo "$dest_ip_port" | cut -d':' -f1)
#     # dest_port=$(echo "$dest_ip_port" | cut -d':' -f2)

#     for port in "${src_port[@]}"; do
#         echo "$port"
#         # Start capturing packets for the application instance
#         echo "Capturing packets for $application_name (PID: $pid) with source IP $src_ip and port $src_port to destination IP $dest_ip and port $dest_port..."
#         sudo tshark -i wlo1 -f "src port $src_port"
#         # sudo tshark -i wlo1 -f "host $src_ip and port $src_port or host $dest_ip and port $dest_port" -k
#         echo "Packet capture for PID $pid stopped."
#     done
#   fi
# done


# // TODO: Try with only one PID
# // TODO: Try to put a time limit on the packet capture

sudo tshark -i wlo1 -a duration:10 -f "tcp or udp" -q -z 'io,phs' -w "$(pwd)/captures/output_file.pcap"


# Use tshark to filter for TCP and UDP packets and extract PID
# sudo tshark -r output_file.pcap -Y "tcp or udp" -T fields -e frame.number -e frame.time -e ip.src -e ip.dst -e tcp.srcport -e tcp.dstport -e udp.srcport -e udp.dstport -e ip.proto > filtered_packets.txt

# # Extract application names from PIDs
# awk '{print $8}' filtered_packets.txt | sort -u | while read pid; do ps -p $pid -o comm=; done > applications.txt

# # Combine PID and application name with filtered packets
# paste filtered_packets.txt applications.txt > final_output.txt

# # command to extract port from lsof output
# lsof -i -n -P | grep spotify | tr -s ' ' |  cut -d' ' -f9 | cut -d: -f2 | cut -d'-' -f1
