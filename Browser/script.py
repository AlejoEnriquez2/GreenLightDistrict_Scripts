import pyautogui
import time
import csv
import subprocess
import random
import os
import signal


class Coordinate:
    def __init__(self, x, y):
        self.X = x
        self.Y = y

class Iteration:
    def __init__(self, mic, cam, ss, t, app):
        self.mic = mic
        self.cam = cam
        self.ss = ss
        self.t = t
        self.app = app

startTime = time.time()
endTime = time.time()
iterationsPath = "randomizedIterations.csv"
randomizedIterations = []

browserOpenPos = Coordinate(37, 473)
browserClosePos = Coordinate(995, 44)
openBookmarkPos = Coordinate(922, 125) # Please create a book mark for each of the applications and put it in the bookmark place

# SKYPE
skypeStartMeetingPath = "Skype/csv/skypeStartMeeting.csv"
skypeScreenSharingPath = "Skype/csv/skypeScreenSharing.csv"
skypeOpenPosition = Coordinate(907, 189) # This will be the position of the skype application in your bookmark 
skypeMicPosition = Coordinate(380, 962)
skypeCameraPosition = Coordinate(526, 999)
skypeStopMeeting = Coordinate(526, 999)
skypeStartMeetingCoordinates = []
skypeShareScreenCoordinates = []

# SLACK
slackStartMeetingPath = "Slack/csv/slackStartMeeting.csv"
slackScreenSharingPath = "Slack/csv/slackScreenSharing.csv"
slackOpenPosition = Coordinate(759, 214) # This will be the position of the slack application in your bookmark 
slackMicPosition = Coordinate(96,1007)
slackCameraPosition = Coordinate(137,1006)
slackStopMeeting = Coordinate(239,1008)
slackStartMeetingCoordinates = []
slackShareScreenCoordinates = []

# DISCORD
discordStartMeetingPath = "Discord/discordStartMeeting.csv"
discordScreenSharingPath = "Discord/discordScreenSharing.csv"
discordCameraPath = "Discord/discordCamera.csv"
discordOpenPosition = Coordinate(788, 240)  # This will be the position of the discord application in your bookmark 
discordMicPosition = Coordinate(292,1059)
discordStopMeeting = Coordinate(834, 1034)
discordStartMeetingCoordinates = []
discordShareScreenCoordinates = []
discordCameraCoordinates = []


with open(iterationsPath, mode='r') as file:
    iterationsPath = csv.reader(file)
    for row in iterationsPath:
        randomizedIterations.append(Iteration(int(row[0]),int(row[1]),int(row[2]),int(row[3]),int(row[4])))
    #random.shuffle(randomizedIterations)

with open(skypeStartMeetingPath, mode='r') as file:
    skypeStartMeetingPath = csv.reader(file)
    for row in skypeStartMeetingPath:
        skypeStartMeetingCoordinates.append(Coordinate(int(row[0]), int(row[1])))

with open(skypeScreenSharingPath, mode='r') as file:
    skypeScreenSharingPath = csv.reader(file)
    for row in skypeScreenSharingPath:
        skypeShareScreenCoordinates.append(Coordinate(int(row[0]), int(row[1])))

with open(slackStartMeetingPath, mode='r') as file:
    slackStartMeetingPath = csv.reader(file)
    for row in slackStartMeetingPath:
        slackStartMeetingCoordinates.append(Coordinate(int(row[0]), int(row[1])))

with open(slackScreenSharingPath, mode='r') as file:
    slackScreenSharingPath = csv.reader(file)
    for row in slackScreenSharingPath:
        slackShareScreenCoordinates.append(Coordinate(int(row[0]), int(row[1])))

with open(discordStartMeetingPath, mode='r') as file:
    discordStartMeetingPath = csv.reader(file)
    for row in discordStartMeetingPath:
        discordStartMeetingCoordinates.append(Coordinate(int(row[0]), int(row[1])))

with open(discordScreenSharingPath, mode='r') as file:
    discordScreenSharingPath = csv.reader(file)
    for row in discordScreenSharingPath:
        discordShareScreenCoordinates.append(Coordinate(int(row[0]), int(row[1])))

with open(discordCameraPath, mode='r') as file:
    discordCameraPath = csv.reader(file)
    for row in discordCameraPath:
        discordCameraCoordinates.append(Coordinate(int(row[0]), int(row[1])))


def click(x,y,t):
    pyautogui.moveTo(x, y)
    pyautogui.click()
    time.sleep(t)

def openBrowser():
    click(browserOpenPos.X, browserOpenPos.Y, 10)

def openBookmark():
    click(openBookmarkPos.X, openBookmarkPos.Y, 10)
    
def closeBrowser():
    click(browserClosePos.X, browserClosePos.Y, 4)

def openSkype():
    click(skypeOpenPosition.X, skypeOpenPosition.Y, 10)

def openSlack():
    click(slackOpenPosition.X, slackOpenPosition.Y, 8)

def openDiscord():
    click(discordOpenPosition.X, discordOpenPosition.Y, 8)


def startSkypeMeeting():     
    for i in skypeStartMeetingCoordinates:        
        click(i.X, i.Y, 5)
def startSlackMeeting():     
    for i in slackStartMeetingCoordinates:        
        click(i.X, i.Y, 4) 
def startDiscordMeeting():     
    for i in discordStartMeetingCoordinates:        
        click(i.X, i.Y, 6) 

def shareSkypeScreen():
    for i in skypeShareScreenCoordinates:
        click(i.X, i.Y, 3)
def shareSlackScreen():
    for i in slackShareScreenCoordinates:
        click(i.X, i.Y, 3)
def shareDiscordScreen():
    for i in discordShareScreenCoordinates:
        click(i.X, i.Y, 3)

def cameraSkypeClick():
    click(skypeCameraPosition.X, skypeCameraPosition.Y, 2)
def cameraSlackClick():
    click(slackCameraPosition.X, slackCameraPosition.Y, 0)
def cameraDiscordClick():
    for i in discordCameraCoordinates:
        click(i.X, i.Y, 3)

def stopSkypeMeeting():
    click(skypeStopMeeting.X, skypeStopMeeting.Y, 4)
def stopSlackMeeting():
    click(slackStopMeeting.X, slackStopMeeting.Y, 4)
def stopDiscordMeeting():
    click(discordStopMeeting.X, discordStopMeeting.Y, 4)

def micSkypeClick():
    click(skypeMicPosition.X, skypeMicPosition.Y, 0)
def micSlackClick():
    click(slackMicPosition.X, slackMicPosition.Y, 0)
def micDiscordClick():
    click(discordMicPosition.X, discordMicPosition.Y, 0)


def startMeasurement(iteration):
    startTime = time.time()
    # print("Start measurement... " + str(startTime))    
    #measure = subprocess.Popen([f"./measurement.sh {iteration.index} {iteration.mic} {iteration.cam} {iteration.ss} {iteration.t} {iteration.app}"], shell=True)
    # print(subprocess.run([f"./measurement.sh {iteration.mic} {iteration.cam} {iteration.ss} {iteration.t} {iteration.app}"], shell=True))    
    time.sleep(iteration.t*3)

    #measure.wait()
    # os.kill(measure.pid, signal.SIGINT)
    
    endTime = time.time() - startTime
    print("Measurement finished... " + str(endTime))
    


def skype(iteration):  
    print("\n")
    print("################# SKYPE #################")
    print(str(iteration.mic) + " | " + str(iteration.cam) + " | " + str(iteration.ss) + " | " + str(iteration.t) + " | " + str(iteration.app))
    openBrowser()
    openBookmark()
    openSkype()
    startSkypeMeeting()
    if(iteration.mic == 0):
        micSkypeClick()
    if(iteration.cam == 1):
        cameraSkypeClick()
    if(iteration.ss == 1):
        shareSkypeScreen()

    startMeasurement(iteration)
    stopSkypeMeeting()
    closeBrowser()  

def slack(iteration):
    print("\n")
    print("################# SLACK #################")
    print(str(iteration.mic) + " | " + str(iteration.cam) + " | " + str(iteration.ss) + " | " + str(iteration.t) + " | " + str(iteration.app))
    openBrowser()
    openBookmark()
    openSlack()
    startSlackMeeting()
    if(iteration.mic == 0):
        micSlackClick()
    if(iteration.cam == 1):
        cameraSlackClick()
    if(iteration.ss == 1):
        shareSlackScreen()

    startMeasurement(iteration)
    stopSlackMeeting()
    closeBrowser()

def discord(iteration):
    print("\n")
    print("################# DISCORD #################")
    print(str(iteration.mic) + " | " + str(iteration.cam) + " | " + str(iteration.ss) + " | " + str(iteration.t) + " | " + str(iteration.app))
    openBrowser()
    openBookmark()
    openDiscord()
    startDiscordMeeting()
    if(iteration.mic == 0):
        micDiscordClick()
    if(iteration.cam == 1):
        cameraDiscordClick()
    if(iteration.ss == 1):
        shareDiscordScreen()    

    startMeasurement(iteration)
    stopDiscordMeeting()
    closeBrowser()

def iterate(iteration):    
    if(iteration.app == 1):     
        skype(iteration)
    if(iteration.app == 2):
        slack(iteration)
    if(iteration.app == 3):
        discord(iteration)

def runIterations():
    rep = 1
    for i in randomizedIterations:
        print("\n")
        print("\n")
        print(str(rep) +": "+ str(i.mic) + " | " + str(i.cam) + " | " + str(i.ss) + " | " + str(i.t) + " | " + str(i.app))
        print("\n")
        print("\n")    
        i.index = rep
        iterate(i)
        time.sleep(50)
        rep += 1
    
runIterations()

