import os
import keyboard
import time

running = True

startVirtualCamera = "sudo modprobe v4l2loopback devices=1 video_nr=1 card_label='VirtualWebCam' exclusive_caps=1"
os.system(startVirtualCamera)
time.sleep(3)

videoCommand = "ffmpeg -re -i media/outputLong.mp4 -map 0:v -f v4l2 /dev/video1"

def startDevices():    
    os.system(videoCommand)

def on_key_event(event):
    global running
    if event.name == 'q':
        running = False

keyboard.on_release_key('q', on_key_event)

while running:
    startDevices()
    time.sleep(1)

keyboard.unhook_all()
