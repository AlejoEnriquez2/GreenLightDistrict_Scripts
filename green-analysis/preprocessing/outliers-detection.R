install.packages("ggplot2")
install.packages("dplyr")
library(ggplot2)
library(dplyr)

check_data <-  read.csv("data-analysis/clean-data.csv")

#electron and web apps data
check_web_data <- check_data %>% filter(app_type == "web")
check_electron_data <- check_data %>% filter(app_type == "electron")

# web apps data
web_energy_data <- check_web_data$energy
web_cpu_data <- check_web_data$cpu
web_network_data <- check_web_data$network
web_memory_data <- check_web_data$memory

#electron apps data
electron_energy_data <- check_electron_data$energy
electron_cpu_data <- check_electron_data$cpu
electron_network_data <- check_electron_data$network
electron_memory_data <- check_electron_data$memory

# Function to calculate mode
# mode <- function(x) {
#   uniq_x <- unique(x)  # Get unique values in the vector
#   freq <- tabulate(match(x, uniq_x))  # Count the frequency of each unique value
#   mode_value <- uniq_x[which.max(freq)]  # Find the unique value with the highest frequency
#   return(mode_value)
# }
# 
# mean_energy <- mean(data_file$energy)
# median_energy <- median(data_file$energy)
# mode_energy <- mode(data_file$energy)
# 
# # Print the variables in a single statement
# print(paste("Mean Energy:", mean_energy, ", Median Energy:", median_energy, ", Mode Energy:", mode_energy))

# Outliers for Web Energy Data
# Calculate Quartiles and IQR for energy
Q1_web_energy <- quantile(web_energy_data, 0.25)
Q3_web_energy <- quantile(web_energy_data, 0.75)
IQR_web_energy <- Q3_web_energy - Q1_web_energy

# Calculate Lower and Upper Bounds
lower_bound_web_energy <- Q1_web_energy - 1.5 * IQR_web_energy
upper_bound_web_energy <- Q3_web_energy + 1.5 * IQR_web_energy

# Identify Outliers
web_energy_outliers <- web_energy_data[web_energy_data < lower_bound_web_energy | web_energy_data > upper_bound_web_energy]
print("Web Energy Outliers:")
print(web_energy_outliers)


# Outliers for Web CPU Data
# Calculate Quartiles and IQR for CPU
Q1_web_cpu <- quantile(web_cpu_data, 0.25)
Q3_web_cpu <- quantile(web_cpu_data, 0.75)
IQR_web_cpu <- Q3_web_cpu - Q1_web_cpu

# Calculate Lower and Upper Bounds
lower_bound_web_cpu <- Q1_web_cpu - 1.5 * IQR_web_cpu
upper_bound_web_cpu <- Q3_web_cpu + 1.5 * IQR_web_cpu

# Identify Outliers
web_cpu_outliers <- web_cpu_data[web_cpu_data < lower_bound_web_cpu | web_cpu_data > upper_bound_web_cpu]
print("Web CPU Outliers:")
print(web_cpu_outliers)


# Outliers for Web Memory Data
# Calculate Quartiles and IQR for Memory
Q1_web_memory <- quantile(web_memory_data, 0.25)
Q3_web_memory <- quantile(web_memory_data, 0.75)
IQR_web_memory <- Q3_web_memory - Q1_web_memory

# Calculate Lower and Upper Bounds
lower_bound_web_memory <- Q1_web_memory - 1.5 * IQR_web_memory
upper_bound_web_memory <- Q3_web_memory + 1.5 * IQR_web_memory

# Identify Outliers
web_memory_outliers <- web_memory_data[web_memory_data < lower_bound_web_memory | web_memory_data > upper_bound_web_memory]
print("Web Memory Outliers:")
print(web_memory_outliers)


# Outliers for Web Network Data
# Calculate Quartiles and IQR for Network
Q1_web_network <- quantile(web_network_data, 0.25)
Q3_web_network <- quantile(web_network_data, 0.75)
IQR_web_network <- Q3_web_network - Q1_web_network

# Calculate Lower and Upper Bounds
lower_bound_web_network <- Q1_web_network - 1.5 * IQR_web_network
upper_bound_web_network <- Q3_web_network + 1.5 * IQR_web_network

# Identify Outliers
web_network_outliers <- web_network_data[web_network_data < lower_bound_web_network | web_network_data > upper_bound_web_network]
print("Web Network Outliers:")
print(web_network_outliers)

# Outliers for Electron Energy Data
# Calculate Quartiles and IQR for energy
Q1_electron_energy <- quantile(electron_energy_data, 0.25)
Q3_electron_energy <- quantile(electron_energy_data, 0.75)
IQR_electron_energy <- Q3_electron_energy - Q1_electron_energy

# Calculate Lower and Upper Bounds
lower_bound_electron_energy <- Q1_electron_energy - 1.5 * IQR_electron_energy
upper_bound_electron_energy <- Q3_electron_energy + 1.5 * IQR_electron_energy

# Identify Outliers
electron_energy_outliers <- electron_energy_data[electron_energy_data < lower_bound_electron_energy | electron_energy_data > upper_bound_electron_energy]
print("Electron Energy Outliers:")
print(electron_energy_outliers)


# Outliers for Electron CPU Data
# Calculate Quartiles and IQR for CPU
Q1_electron_cpu <- quantile(electron_cpu_data, 0.25)
Q3_electron_cpu <- quantile(electron_cpu_data, 0.75)
IQR_electron_cpu <- Q3_electron_cpu - Q1_electron_cpu

# Calculate Lower and Upper Bounds
lower_bound_electron_cpu <- Q1_electron_cpu - 1.5 * IQR_electron_cpu
upper_bound_electron_cpu <- Q3_electron_cpu + 1.5 * IQR_electron_cpu

# Identify Outliers
electron_cpu_outliers <- electron_cpu_data[electron_cpu_data < lower_bound_electron_cpu | electron_cpu_data > upper_bound_electron_cpu]
print("Electron CPU Outliers:")
print(electron_cpu_outliers)


# Outliers for Electron Memory Data
# Calculate Quartiles and IQR for Memory
Q1_electron_memory <- quantile(electron_memory_data, 0.25)
Q3_electron_memory <- quantile(electron_memory_data, 0.75)
IQR_electron_memory <- Q3_electron_memory - Q1_electron_memory

# Calculate Lower and Upper Bounds
lower_bound_electron_memory <- Q1_electron_memory - 1.5 * IQR_electron_memory
upper_bound_electron_memory <- Q3_electron_memory + 1.5 * IQR_electron_memory

# Identify Outliers
electron_memory_outliers <- electron_memory_data[electron_memory_data < lower_bound_electron_memory | electron_memory_data > upper_bound_electron_memory]
print("Electron Memory Outliers:")
print(electron_memory_outliers)


# Outliers for Electron Network Data
# Calculate Quartiles and IQR for Network
Q1_electron_network <- quantile(electron_network_data, 0.25)
Q3_electron_network <- quantile(electron_network_data, 0.75)
IQR_electron_network <- Q3_electron_network - Q1_electron_network

# Calculate Lower and Upper Bounds
lower_bound_electron_network <- Q1_electron_network - 1.5 * IQR_electron_network
upper_bound_electron_network <- Q3_electron_network + 1.5 * IQR_electron_network

# Identify Outliers
electron_network_outliers <- electron_network_data[electron_network_data < lower_bound_electron_network | electron_network_data > upper_bound_electron_network]
print("Electron Network Outliers:")
print(electron_network_outliers)


