from pynput.mouse import Listener
import csv

csv_filename = 'clicks.csv'

print('Press Ctrl-C to quit.')
try:
    def on_click(x, y, button, pressed):
        if pressed and button == button.left:
            print("Left mouse button clicked at ({}, {})".format(x, y))
            with open(csv_filename, mode='a', newline='') as file:
                writer = csv.writer(file)
                writer.writerow([x, y])
    
    with Listener(on_click=on_click) as listener:
        listener.join()
except KeyboardInterrupt:
    print('\n')