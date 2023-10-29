install.packages("ggplot2")
install.packages("dplyr")
install.packages("stats")
library(ggplot2)
library(dplyr)
library(stats)


#access the data file, data_file is global variable, which are gonna fuck me up at some point. 
data_file

# descriptive statistics
# Summaries for web apps
# 1st Quartile, that 25% of values fall below this point, 25% data is less than or equal to first quartile

# Energy
summary(data_file_web_2$energy)
summary(data_file_web_8$energy)
summary(data_file_electron_2$energy)
summary(data_file_electron_8$energy)

# Network
summary(data_file_web_2$network)
summary(data_file_web_8$network)
summary(data_file_electron_2$network)
summary(data_file_electron_8$network)

# CPU
summary(data_file_web_2$cpu)
summary(data_file_web_8$cpu)
summary(data_file_electron_2$cpu)
summary(data_file_electron_8$cpu)

# Memory
summary(data_file_web_2$memory)
summary(data_file_web_8$memory)
summary(data_file_electron_2$memory)
summary(data_file_electron_8$memory)

