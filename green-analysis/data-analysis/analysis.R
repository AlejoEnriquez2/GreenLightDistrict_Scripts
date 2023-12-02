install.packages("ggplot2")
install.packages("dplyr")
install.packages("stats")
library(ggplot2)
library(dplyr)
library(stats)


#access the data file, data_file is global variable. 
data_file

calculate_stats <- function(data_name, data_column) {
  # Standard deviation calculation
  std_dev <- sd(data_column)
  
  # Coefficient of Variation (CV) calculation
  mean_value <- mean(data_column)
  cv <- (std_dev / mean_value) * 100
  
  # Returning standard deviation and coefficient of variation
  print(data_name)
  return(list(Standard_Deviation = std_dev, Coefficient_of_Variation = cv))
}


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

# Calling the function for each column
calculate_stats("data_file_web_2$energy", data_file_web_2$energy)
calculate_stats("data_file_web_8$energy", data_file_web_8$energy)
calculate_stats("data_file_electron_2$energy", data_file_electron_2$energy)
calculate_stats("data_file_electron_8$energy", data_file_electron_8$energy)

calculate_stats("data_file_web_2$network", data_file_web_2$network)
calculate_stats("data_file_web_8$network", data_file_web_8$network)
calculate_stats("data_file_electron_2$network", data_file_electron_2$network)
calculate_stats("data_file_electron_8$network", data_file_electron_8$network)

calculate_stats("data_file_web_2$cpu", data_file_web_2$cpu)
calculate_stats("data_file_web_8$cpu", data_file_web_8$cpu)
calculate_stats("data_file_electron_2$cpu", data_file_electron_2$cpu)
calculate_stats("data_file_electron_8$cpu", data_file_electron_8$cpu)

calculate_stats("data_file_web_2$memory", data_file_web_2$memory)
calculate_stats("data_file_web_8$memory", data_file_web_8$memory)
calculate_stats("data_file_electron_2$memory", data_file_electron_2$memory)
calculate_stats("data_file_electron_8$memory", data_file_electron_8$memory)

