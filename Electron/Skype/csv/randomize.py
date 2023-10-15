import csv
import random

# Read the CSV file into a list of rows
with open('iterations.csv', 'r') as input_file:
    csv_reader = csv.reader(input_file)
    rows = list(csv_reader)

# Randomize the order of rows
random.shuffle(rows)

# Write the randomized rows back to a new CSV file
with open('randomizedIterations.csv', 'w', newline='') as output_file:
    csv_writer = csv.writer(output_file)
    for row in rows:
        csv_writer.writerow(row)
