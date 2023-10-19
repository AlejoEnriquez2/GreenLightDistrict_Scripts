import pyautogui
import time
import csv
import subprocess
import random

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

# SKYPE
skypeStartMeetingPath = "Skype/csv/skypeStartMeeting.csv"
skypeScreenSharingPath = "Skype/csv/skypeScreenSharing.csv"
skypeOpenPosition = Coordinate(35,403)
skypeMicPosition = Coordinate(463,1048)
skypeCameraPosition = Coordinate(528,1044)
skypeStopMeeting = Coordinate(607,1048)
skypeClosePosition = Coordinate(977,46)
skypeStartMeetingCoordinates = []
skypeShareScreenCoordinates = []

# SLACK
slackStartMeetingPath = "Slack/csv/slackStartMeeting.csv"
slackScreenSharingPath = "Slack/csv/slackScreenSharing.csv"
slackOpenPosition = Coordinate(36,334)
slackMicPosition = Coordinate(101,1054)
slackCameraPosition = Coordinate(135,1054)
slackStopMeeting = Coordinate(244,1058)
slackClosePosition = Coordinate(975,45)
slackStartMeetingCoordinates = []
slackShareScreenCoordinates = []

# DISCORD
discordStartMeetingPath = "Discord/discordStartMeeting.csv"
discordScreenSharingPath = "Discord/discordScreenSharing.csv"
discordCameraPath = "Discord/discordCamera.csv"
discordOpenPosition = Coordinate(32,271)
discordMicPosition = Coordinate(290,1052)
discordStopMeeting = Coordinate(830,1037)
discordClosePosition = Coordinate(989,44)
discordStartMeetingCoordinates = []
discordShareScreenCoordinates = []
discordCameraCoordinates = []


with open(iterationsPath, mode='r') as file:
    iterationsPath = csv.reader(file)
    for row in iterationsPath:
        randomizedIterations.append(Iteration(int(row[0]),int(row[1]),int(row[2]),int(row[3]),int(row[4])))
    random.shuffle(randomizedIterations)

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
    skypeScreenSharingPath = csv.reader(file)
    for row in skypeScreenSharingPath:
        skypeShareScreenCoordinates.append(Coordinate(int(row[0]), int(row[1])))

with open(discordCameraPath, mode='r') as file:
    discordCameraPath = csv.reader(file)
    for row in discordCameraPath:
        discordCameraCoordinates.append(Coordinate(int(row[0]), int(row[1])))


def click(x,y,t):
    pyautogui.moveTo(x, y)
    pyautogui.click()
    time.sleep(t)

def openSkype():
    click(skypeOpenPosition.X, skypeOpenPosition.Y, 10)
def closeSkype():
    click(skypeClosePosition.X, skypeClosePosition.Y, 4)

def openSlack():
    click(slackOpenPosition.X, slackOpenPosition.Y, 8)
def closeSlack():
    click(slackClosePosition.X, slackClosePosition.Y, 4)

def openDiscord():
    click(discordOpenPosition.X, discordOpenPosition.Y, 8)
def closeDiscord():
    click(discordClosePosition.X, discordClosePosition.Y, 4)


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
    click(skypeCameraPosition.X, skypeCameraPosition.Y, 0)
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
    print("Start measurement... " + str(startTime))    
    measure = subprocess.Popen([f"./measurement.sh {iteration.mic} {iteration.cam} {iteration.ss} {iteration.t} {iteration.app}"], shell=True)
    # print(subprocess.run([f"./measurement.sh {iteration.mic} {iteration.cam} {iteration.ss} {iteration.t} {iteration.app}"], shell=True))    
    time.sleep(iteration.t*5)

    measure.wait()
    measure.kill()

    aggregate = subprocess.Popen([f"./aggregation.sh {iteration.mic}_{iteration.cam}_{iteration.ss}_{iteration.t}_{iteration.app}"], shell=True)
    # print(subprocess.run([f"./aggregation.sh {iteration.mic}_{iteration.cam}_{iteration.ss}_{iteration.t}_{iteration.app}"], shell=True))
    
    endTime = time.time()
    print("Measurement finished... " + str(endTime))
    
    aggregate.wait()
    aggregate.kill()


def skype(iteration):  
    # startMeasurement(iteration)
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
    closeSkype()  

def slack(iteration):
    # startMeasurement(iteration)
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
    closeSlack()

def discord(iteration):
    # startMeasurement(iteration)
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
    closeDiscord()

def iterate(iteration):    
    if(iteration.app == 1):     
        skype(iteration)
    if(iteration.app == 2):
        slack(iteration)
    if(iteration.app == 3):
        discord(iteration)

def runIterations():
    rep = 0
    for i in randomizedIterations:
        print(str(rep) +": "+ str(i.mic) + " | " + str(i.cam) + " | " + str(i.ss) + " | " + str(i.t) + " | " + str(i.app))
        iterate(i)
        rep += 1
    
runIterations()


