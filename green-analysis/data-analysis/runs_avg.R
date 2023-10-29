# take mean for runs of each configuration

data_file


# Group the data by the specified columns and calculate average for network, memory, energy, and cpu
avg_config_data <- aggregate(cbind(network, memory, energy, cpu) ~ microphone + camera + screen + duration + app + app_type, 
                          data = data_file, FUN = function(x) mean(as.numeric(as.character(x))))

# Print the new grouped data
print(avg_config_data)

# Write the avg run data to the  CSV file
write.csv(avg_config_data, file = "data-analysis/avg-config-data.csv", row.names = FALSE, quote = FALSE)

# Check the updated contents of the CSV file
read.csv("data-analysis/avg-config-data.csv")

# get the data for each electon app
skype_electron_avg_data <- avg_config_data %>% filter(app == 1 & app_type == "electron")
slack_electron_avg_data <- avg_config_data %>% filter(app == 2   & app_type == "electron")
discord_electron_avg_data <- avg_config_data %>% filter(app == 3 &  app_type == "electron")

# get the data for each electon app
skype_web_avg_data <- avg_config_data %>% filter(app == 1 & app_type == "web")
slack_web_avg_data <- avg_config_data %>% filter(app == 2   & app_type == "web")
discord_web_avg_data <- avg_config_data %>% filter(app == 3 &  app_type == "web")
