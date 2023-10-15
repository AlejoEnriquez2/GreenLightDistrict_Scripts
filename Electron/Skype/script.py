import pyautogui
import time
import csv

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
skypeStartMeetingPath = "csv/Skype/skypeStartMeeting.csv"
skypeScreenSharingPath = "csv/Skype/skypeScreenSharing.csv"
skypeOpenPosition = Coordinate(35,403)
skypeMicPosition = Coordinate(463,1048)
skypeCameraPosition = Coordinate(528,1044)
skypeStopMeeting = Coordinate(607,1048)
skypeClosePosition = Coordinate(977,46)
skypeStartMeetingCoordinates = []
skypeShareScreenCoordinates = []


# SLACK
slackStartMeetingPath = "csv/Slack/slackStartMeeting.csv"
slackScreenSharingPath = "csv/Slack/slackScreenSharing.csv"
slackOpenPosition = Coordinate(36,334)
slackMicPosition = Coordinate(101,1054)
slackCameraPosition = Coordinate(135,1054)
slackStopMeeting = Coordinate(244,1058)
slackClosePosition = Coordinate(972,46)
slackStartMeetingCoordinates = []
slackShareScreenCoordinates = []

# DISCORD
discordStartMeetingPath = "csv/Discord/discordStartMeeting.csv"
discordScreenSharingPath = "csv/Discord/discordScreenSharing.csv"
discordOpenPosition = Coordinate(36,334)
discordMicPosition = Coordinate(101,1054)
discordCameraPosition = Coordinate(135,1054)
discordStopMeeting = Coordinate(244,1058)
discordClosePosition = Coordinate(972,46)
discordStartMeetingCoordinates = []
discordShareScreenCoordinates = []



with open(iterationsPath, mode='r') as file:
    iterationsPath = csv.reader(file)
    for row in iterationsPath:
        randomizedIterations.append(Iteration(int(row[0]),int(row[1]),int(row[2]),int(row[3]),int(row[4])))

with open(skypeStartMeetingPath, mode='r') as file:
    skypeStartMeetingPath = csv.reader(file)
    for row in skypeStartMeetingPath:
        skypeStartMeetingCoordinates.append(Coordinate(int(row[0]), int(row[1])))

with open(skypeScreenSharingPath, mode='r') as file:
    skypeScreenSharingPath = csv.reader(file)
    for row in skypeScreenSharingPath:
        skypeShareScreenCoordinates.append(Coordinate(int(row[0]), int(row[1])))

def click(x,y,t):
    pyautogui.moveTo(x, y)
    pyautogui.click()
    time.sleep(t)

def openSkype():
    click(skypeOpenPosition.X, skypeOpenPosition.Y, 8)

def closeSkype():
    click(skypeClosePosition.X, skypeClosePosition.Y, 4)

def startMeeting():     
    for i in skypeStartMeetingCoordinates:        
        click(i.X, i.Y, 4) 

def shareScreen():
    for i in skypeShareScreenCoordinates:
        click(i.X, i.Y, 3)

def cameraClick():
    click(skypeCameraPosition.X, skypeCameraPosition.Y, 0)

def stopMeeting():
    click(skypeStopMeeting.X, skypeStopMeeting.Y, 4)

def micClick():
    click(skypeMicPosition.X, skypeMicPosition.Y, 0)


def skype():  
    # Start meeting
    startMeeting()
    time.sleep(5)

    #Share screen
    shareScreen()
    time.sleep(3)

    #Turn OFF MIC
    micClick()
    time.sleep(3)

    #Turn ON CAMERA
    cameraClick()
    time.sleep(10)

    # Stop meeting
    stopMeeting()     


def iterate(iteration):
    openSkype()
    if(iteration.app == 1):     
        startMeeting()
        if(iteration.mic == 0):
            micClick()
        if(iteration.cam == 1):
            cameraClick()
        if(iteration.ss == 1):
            shareScreen()

        startTime = time.time()
        print("Start measurement... " + str(startTime))
        time.sleep(iteration.t*5)
        endTime = time.time()
        print("Measurement finished... " + str(endTime))
        stopMeeting()
        closeSkype()

def runIterations():
    for i in randomizedIterations:
        print(str(i.mic) + " | " + str(i.cam) + " | " + str(i.ss) + " | " + str(i.t) + " | " + str(i.app))
        iterate(i)
    
runIterations()


