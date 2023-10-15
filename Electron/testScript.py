import pyautogui
import time

# Coordinates
x = 100
y = 100

pyautogui.moveTo(x, y)


def testClick():
    pyautogui.press('ctrlleft')
    pyautogui.click()
    time.sleep(3)
    pyautogui.press('ctrlleft')
    pyautogui.click()

#testClick()