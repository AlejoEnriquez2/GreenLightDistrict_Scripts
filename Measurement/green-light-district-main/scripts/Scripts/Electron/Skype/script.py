import pyautogui
import time
import csv

class Coordinate:
    def __init__(self, x, y):
        self.X = x
        self.Y = y


clickStartSkype = "csv/skypeStartMeeting.csv"
clickStopSkype = Coordinate(1072, 1054)
clickMic = Coordinate(100,100)
clickCamera = "csv/skypeCamera.csv"
clickScreenSharing = "csv/skypeScreenSharing.csv"

startMeeting = []


with open(clickStartSkype, mode='r') as file:
    clickStartSkype = csv.reader(file)
    for row in clickStartSkype:
        startMeeting.append(Coordinate(int(row[0]), int(row[1])))

def skypeClick(x,y,t):
    pyautogui.moveTo(x, y)
    pyautogui.click()
    time.sleep(t)    

def skype():
    print(len(startMeeting))
    for i in startMeeting:        
        skypeClick(i.X, i.Y, 3)
    time.sleep(10)
    skypeClick(clickStopSkype.X, clickStopSkype.Y, 0)

skype()



