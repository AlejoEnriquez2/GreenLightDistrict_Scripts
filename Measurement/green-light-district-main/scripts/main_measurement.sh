#!/bin/bash

# Your code goes here
cd experiment-runner/examples/linux-powerjoular-profiling

sudo apt install cpulimit

python3 -m venv venv

source venv/bin/activate

pip install -r requirements.txt

cd ../../

pip install -r requirements.txt

python3 experiment-runner/ examples/linux-powerjoular-profiling/RunnerConfig.py

