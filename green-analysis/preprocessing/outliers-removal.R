install.packages("ggplot2")
install.packages("dplyr")
library(ggplot2)
library(dplyr)

raw_data <- read.csv("data-analysis/data.csv")
clean_data <- raw_data

# Create an empty data frame with the column names you need - store clean data in this data frame
final_data <- data.frame(run_id = character(),
                         app_type = character(),
                         microphone = character(), 
                         camera = character(), 
                         screen = character(), 
                         duration = character(), 
                         app = character(), 
                         network = character(), 
                         memory = character(),
                         energy =  character(),
                         cpu = character(),
                         stringsAsFactors = FALSE)

#electron and web apps data
clean_web_data <- clean_data %>% filter(app_type == "web")
clean_electron_data <- clean_data %>% filter(app_type == "electron")


# Outliers for Web Energy Data
# Calculate Quartiles and IQR for energy
Q1_web_energy <- quantile(clean_web_data$energy, 0.25)
Q3_web_energy <- quantile(clean_web_data$energy, 0.75)
IQR_web_energy <- Q3_web_energy - Q1_web_energy

# Calculate Lower and Upper Bounds
lower_bound_web_energy <- Q1_web_energy - 1.5 * IQR_web_energy
upper_bound_web_energy <- Q3_web_energy + 1.5 * IQR_web_energy

# Identify Outliers
web_energy_outliers <- clean_web_data$energy[clean_web_data$energy < lower_bound_web_energy | clean_web_data$energy > upper_bound_web_energy]
print("Web Energy Outliers:")
print(web_energy_outliers)

# Replace Outliers with Lower and Upper Bounds
clean_web_data$energy[clean_web_data$energy < lower_bound_web_energy] <- lower_bound_web_energy
clean_web_data$energy[clean_web_data$energy > upper_bound_web_energy] <- upper_bound_web_energy


# Outliers for Web CPU Data
# Calculate Quartiles and IQR for CPU
Q1_web_cpu <- quantile(clean_web_data$cpu, 0.25)
Q3_web_cpu <- quantile(clean_web_data$cpu, 0.75)
IQR_web_cpu <- Q3_web_cpu - Q1_web_cpu

# Calculate Lower and Upper Bounds
lower_bound_web_cpu <- Q1_web_cpu - 1.5 * IQR_web_cpu
upper_bound_web_cpu <- Q3_web_cpu + 1.5 * IQR_web_cpu

# Identify Outliers
web_cpu_outliers <- clean_web_data$cpu[clean_web_data$cpu < lower_bound_web_cpu | clean_web_data$cpu > upper_bound_web_cpu]
print("Web CPU Outliers:")
print(web_cpu_outliers)

# Replace Outliers in CPU with Lower and Upper Bounds
clean_web_data$cpu[clean_web_data$cpu < lower_bound_web_cpu] <- lower_bound_web_cpu
clean_web_data$cpu[clean_web_data$cpu > upper_bound_web_cpu] <- upper_bound_web_cpu


# Outliers for Web Memory Data
# Calculate Quartiles and IQR for Memory
Q1_web_memory <- quantile(clean_web_data$memory, 0.25)
Q3_web_memory <- quantile(clean_web_data$memory, 0.75)
IQR_web_memory <- Q3_web_memory - Q1_web_memory

# Calculate Lower and Upper Bounds
lower_bound_web_memory <- Q1_web_memory - 1.5 * IQR_web_memory
upper_bound_web_memory <- Q3_web_memory + 1.5 * IQR_web_memory

# Identify Outliers
web_memory_outliers <- clean_web_data$memory[clean_web_data$memory < lower_bound_web_memory | clean_web_data$memory > upper_bound_web_memory]
print("Web Memory Outliers:")
print(web_memory_outliers)

# Replace Outliers in Memory with Lower and Upper Bounds
clean_web_data$memory[web_memory_data < lower_bound_web_memory] <- lower_bound_web_memory
clean_web_data$memory[web_memory_data > upper_bound_web_memory] <- upper_bound_web_memory



# Outliers for Web Network Data
# Calculate Quartiles and IQR for Network
Q1_web_network <- quantile(clean_web_data$network, 0.25)
Q3_web_network <- quantile(clean_web_data$network, 0.75)
IQR_web_network <- Q3_web_network - Q1_web_network

# Calculate Lower and Upper Bounds
lower_bound_web_network <- Q1_web_network - 1.5 * IQR_web_network
upper_bound_web_network <- Q3_web_network + 1.5 * IQR_web_network

# Identify Outliers
web_network_outliers <- clean_web_data$network[clean_web_data$network < lower_bound_web_network | clean_web_data$network > upper_bound_web_network]
print("Web Network Outliers:")
print(web_network_outliers)

# Replace Outliers in Network with Lower and Upper Bounds
clean_web_data$network[clean_web_data$network < lower_bound_web_network] <- lower_bound_web_network
clean_web_data$network[clean_web_data$network > upper_bound_web_network] <- upper_bound_web_network


final_data <- rbind(final_data, clean_web_data)


# Outliers for Electron Energy Data
# Calculate Quartiles and IQR for Energy
Q1_electron_energy <- quantile(clean_electron_data$energy, 0.25)
Q3_electron_energy <- quantile(clean_electron_data$energy, 0.75)
IQR_electron_energy <- Q3_electron_energy - Q1_electron_energy

# Calculate Lower and Upper Bounds
lower_bound_electron_energy <- Q1_electron_energy - 1.5 * IQR_electron_energy
upper_bound_electron_energy <- Q3_electron_energy + 1.5 * IQR_electron_energy

# Identify Outliers
electron_energy_outliers <- clean_electron_data$energy[clean_electron_data$energy < lower_bound_electron_energy | clean_electron_data$energy > upper_bound_electron_energy]
print("Electron Energy Outliers:")
print(electron_energy_outliers)

# Replace Outliers in Energy with Lower and Upper Bounds
clean_electron_data$energy[clean_electron_data$energy < lower_bound_electron_energy] <- lower_bound_electron_energy
clean_electron_data$energy[clean_electron_data$energy > upper_bound_electron_energy] <- upper_bound_electron_energy


# Outliers for Electron CPU Data
# Calculate Quartiles and IQR for CPU
Q1_electron_cpu <- quantile(clean_electron_data$cpu, 0.25)
Q3_electron_cpu <- quantile(clean_electron_data$cpu, 0.75)
IQR_electron_cpu <- Q3_electron_cpu - Q1_electron_cpu

# Calculate Lower and Upper Bounds
lower_bound_electron_cpu <- Q1_electron_cpu - 1.5 * IQR_electron_cpu
upper_bound_electron_cpu <- Q3_electron_cpu + 1.5 * IQR_electron_cpu

# Identify Outliers
electron_cpu_outliers <- clean_electron_data$cpu[clean_electron_data$cpu < lower_bound_electron_cpu | clean_electron_data$cpu > upper_bound_electron_cpu]
print("Electron CPU Outliers:")
print(electron_cpu_outliers)

# Replace Outliers in CPU with Lower and Upper Bounds
clean_electron_data$cpu[clean_electron_data$cpu < lower_bound_electron_cpu] <- lower_bound_electron_cpu
clean_electron_data$cpu[clean_electron_data$cpu > upper_bound_electron_cpu] <- upper_bound_electron_cpu

# Outliers for Electron Memory Data
# Calculate Quartiles and IQR for Memory
Q1_electron_memory <- quantile(clean_electron_data$memory, 0.25)
Q3_electron_memory <- quantile(clean_electron_data$memory, 0.75)
IQR_electron_memory <- Q3_electron_memory - Q1_electron_memory

# Calculate Lower and Upper Bounds
lower_bound_electron_memory <- Q1_electron_memory - 1.5 * IQR_electron_memory
upper_bound_electron_memory <- Q3_electron_memory + 1.5 * IQR_electron_memory

# Identify Outliers
electron_memory_outliers <- clean_electron_data$memory[clean_electron_data$memory < lower_bound_electron_memory | clean_electron_data$memory > upper_bound_electron_memory]
print("Electron Memory Outliers:")
print(electron_memory_outliers)

# Replace Outliers in Memory with Lower and Upper Bounds
clean_electron_data$memory[clean_electron_data$memory < lower_bound_electron_memory] <- lower_bound_electron_memory
clean_electron_data$memory[clean_electron_data$memory > upper_bound_electron_memory] <- upper_bound_electron_memory



# Outliers for Electron Network Data
# Calculate Quartiles and IQR for Network
Q1_electron_network <- quantile(clean_electron_data$network, 0.25)
Q3_electron_network <- quantile(clean_electron_data$network, 0.75)
IQR_electron_network <- Q3_electron_network - Q1_electron_network

# Calculate Lower and Upper Bounds
lower_bound_electron_network <- Q1_electron_network - 1.5 * IQR_electron_network
upper_bound_electron_network <- Q3_electron_network + 1.5 * IQR_electron_network

# Identify Outliers
electron_network_outliers <- clean_electron_data$network[clean_electron_data$network < lower_bound_electron_network | clean_electron_data$network > upper_bound_electron_network]
print("Electron Network Outliers:")
print(electron_network_outliers)

# Replace Outliers in Network with Lower and Upper Bounds
clean_electron_data$network[clean_electron_data$network < lower_bound_electron_network] <- lower_bound_electron_network
clean_electron_data$network[clean_electron_data$network > upper_bound_electron_network] <- upper_bound_electron_network


final_data <- rbind(final_data, clean_electron_data)

# Write the appended data to the existing CSV file
write.csv(final_data, file = "data-analysis/clean-data.csv", row.names = FALSE, quote = FALSE)

# Check the updated contents of the CSV file
read.csv("data-analysis/clean-data.csv")

