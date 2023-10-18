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

time=$((t * 60))
echo "Measuring $app_name for $time seconds"

sudo powerjoular -l -a "$app_name" -f "powerjoular.csv" &

exit 0



