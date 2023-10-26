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

## Browser

### Folder structure
- __Browser__
   - __Discord__
     - [discordCamera.csv](Discord/discordCamera.csv)
     - [discordScreenSharing.csv](Discord/discordScreenSharing.csv)
     - [discordStartMeeting.csv](Discord/discordStartMeeting.csv)
   - __Skype__
     - [skypeScreenSharing.csv](Skype/skypeScreenSharing.csv)
     - [skypeStartMeeting.csv](Skype/skypeStartMeeting.csv)
   - __Slack__
     - [slackScreenSharing.csv](Slack/slackScreenSharing.csv)
     - [slackStartMeeting.csv](Slack/slackStartMeeting.csv)
   - [measurement.sh](measurement.sh)
   - [script.py](script.py)

## Electron
### Folder structure
- __Electron__
   - __Discord__
     - [discordCamera.csv](Discord/discordCamera.csv)
     - [discordScreenSharing.csv](Discord/discordScreenSharing.csv)
     - [discordStartMeeting.csv](Discord/discordStartMeeting.csv)
   - __Skype__
     - [skypeScreenSharing.csv](Skype/skypeScreenSharing.csv)
     - [skypeStartMeeting.csv](Skype/skypeStartMeeting.csv)
   - __Slack__
     - [slackScreenSharing.csv](Slack/slackScreenSharing.csv)
     - [slackStartMeeting.csv](Slack/slackStartMeeting.csv)
   - [measurement.sh](measurement.sh)
   - [script.py](script.py)

## Utility
#### Folder structure
- __Utility__
     - [VirtualCamera.py](Utility/VirtualCamera.py)
     - [VirtualMicrophone.py](Utility/VirtualMicrophone.py)
     - [iterations.csv](Utility/iterations.csv)
     - __media__
       - [audio.mp3](Utility/media/audio.mp3)
     - [mouseCoordinates.py](Utility/mouseCoordinates.py)



