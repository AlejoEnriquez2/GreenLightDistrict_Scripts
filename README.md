# Watt’s the Difference? Electron vs. Web: A Comparative Analysis of Energy and Performance in Communication Apps

This repository serves as a supplementary page for the associated paper "Watt’s the Difference? Electron vs. Web: A Comparative Analysis of Energy and Performance in Communication Apps", created to conduct the an empirical experimentation as apart of Green Lab(X_418158) class 2023/2024 semester project at VU(Vrije Universiteit Amsterdam).

This research aims to thoroughly analyze apps like Skype, Discord, and Slack that use Electron technology, comparing them to their web-based versions. The goal is to measure how much energy and computing resources they consume, focusing on performance. By doing this, we want to give regular users and companies solid information to make environmentally friendly software decisions.

Accordingly, This repository is devided into three main parts: 
- The Browse experiment (`Browser` folder) 
- The Electron experiment (`Electron` folder)
- The Utility which is used by both section of the experiment (`Utility` folder).

## Prerequisite

1. Make sure you have Python in your system if not download it [here](https://www.python.org/downloads/)

2. Install all the python library required to run the system

(The libraries were listed inside app folder in requirements.txt)

```pip install -r requirements.txt```

## Information in ACTION!
You can also find more information about this experiment in action from this clip [here](https://www.youtube.com/watch?v=xPcLVBPud18) or if you want to only see how the script work you can jump to  [here](https://youtu.be/xPcLVBPud18?t=396)

## Browser

### Folder structure
   - __Browser__
     - __Discord__
       - [discordCamera.csv](Browser/Discord/discordCamera.csv)
       - [discordScreenSharing.csv](Browser/Discord/discordScreenSharing.csv)
       - [discordStartMeeting.csv](Browser/Discord/discordStartMeeting.csv)
     - __Skype__
       - [skypeScreenSharing.csv](Browser/Skype/skypeScreenSharing.csv)
       - [skypeStartMeeting.csv](Browser/Skype/skypeStartMeeting.csv)
     - __Slack__
       - [slackScreenSharing.csv](Browser/Slack/slackScreenSharing.csv)
       - [slackStartMeeting.csv](Browser/Slack/slackStartMeeting.csv)
     - [measurement.sh](Browser/measurement.sh)
     - [script.py](Browser/script.py)

## Electron
### Folder structure
   - __Electron__
     - __Discord__
       - [discordCamera.csv](Electron/Discord/discordCamera.csv)
       - [discordScreenSharing.csv](Electron/Discord/discordScreenSharing.csv)
       - [discordStartMeeting.csv](Electron/Discord/discordStartMeeting.csv)
     - __Skype__
       - [skypeScreenSharing.csv](Electron/Skype/skypeScreenSharing.csv)
       - [skypeStartMeeting.csv](Electron/Skype/skypeStartMeeting.csv)
     - __Slack__
       - [slackScreenSharing.csv](Electron/Slack/slackScreenSharing.csv)
       - [slackStartMeeting.csv](Electron/Slack/slackStartMeeting.csv)
     - [measurement.sh](Electron/measurement.sh)
     - [script.py](Electron/script.py)

## Utility
#### Folder structure
   - __Utility__
     - [VirtualCamera.py](Utility/VirtualCamera.py)
     - [VirtualMicrophone.py](Utility/VirtualMicrophone.py)
     - [iterations.csv](Utility/iterations.csv)
     - __media__
       - [audio.mp3](Utility/media/audio.mp3)
     - [mouseCoordinates.py](Utility/mouseCoordinates.py)



## Data-Analysis
The "green-analysis" directory consists of a R project for data-analysis of experiment data.

#### Folder structure
  - __preprocessing__
  This directory consists of R files to clean the raw data, and use it for data analysis.
  Note: The data folder is not upploaded on GitHub, so data-preprocessing can't be run without it. The raw data is in `data-analysis/data.csv` file. The clean data after preprocessing is stored in ``data-analysis/clean-data.csv`
    - [data-preprocessing.R](green-analysis/preprocessing/data-preprocessing.R)
    - [outliers-detection.R](green-analysis/preprocessing/outliers-detection.R)
    - [outliers-removal.R](green-analysis//preprocessing/outliers-removal.R)
  - __data-analysis__
    `data-analysis` folder consists of r files for performing data-analysis methods on data, and the resulting data files.
    - [Whitney.R](green-analysis/data-analysis/Whitney.R)
    - [data.csv](green-analysis/data-analysis/data.csv)
    - [runs_avg.R](green-analysis/data-analysis/runs_avg.R)
    - [analysis.R](green-analysis/data-analysis/analysis.R)
    - [transformation.R](green-analysis/data-analysis/transformation.R)
    - [avg-config-data.csv](green-analysis/data-analysis/avg-config-data.csv)
    - [delta-whitney-test.R](green-analysis/data-analysis/delta-whitney-test.R)
    - [transformed-data.csv](green-analysis/data-analysis/transformed-data.csv)
    - [clean-data.csv](green-analysis/data-analysis/clean-data.csv)
    - [normality.R](green-analysis/data-analysis/normality.R)
    - [variables.R](green-analysis/data-analysis/variables.R)
    - [correction.R](green-analysis/data-analysis/correction.R)
    - [p-values-duration.csv](green-analysis/data-analysis/p-values-duration.csv)
    - [visualization.R](green-analysis/data-analysis/visualization.R)
    - [p-values-mode.csv](green-analysis/data-analysis/p-values-mode.csv)
  - __graphs__
    Folder containing all graphs and plots images
  - __renv__
    This directory is for R virtual environment.

