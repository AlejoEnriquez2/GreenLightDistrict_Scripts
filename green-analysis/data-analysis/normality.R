library(ggplot2)
data_file
avg_config_data_file
transform_data_file

# normality function
check_normality <- function(col_to_eval, plot_title) {

  shapiro_result <- shapiro.test(col_to_eval)
  p_value <- shapiro_result$p.value
  if(p_value > 0.05) {
    qqnorm(col_to_eval, xlab="Normal quantiles", ylab="Sample quantiles")
    qqline(col_to_eval, col = "black")
  }
  if(p_value < 0.05){
    hist(col_to_eval, 
         main = "Duration Histogram",         # Title of the histogram
         xlab = plot_title,      # Label for the x-axis
         ylab = "Frequency",         # Label for the y-axis
         col = "skyblue",            # Color of the bars
         border = "black"          # Color of the border around bars
    )
  }

  print(shapiro_result) # need to print explicitly in a loop
  return(shapiro_result$p.value) # Return only the p-value
}

# all combinations we need-electron and web data when considering 2 and 8 mins duration and mode of interaction
# electron app first - 2 and 8 mins and 4 modes of interaction

electron_micon_2 <- data_file %>% filter(app_type == "electron" & duration == 2 & microphone == 1 & camera == 0 & screen == 0)
electron_camera_2 <- data_file %>% filter(app_type == "electron" & duration == 2 & microphone == 1 & camera == 1 & screen == 0)
electron_screen_mic_2 <- data_file %>% filter(app_type == "electron" & duration == 2 & microphone == 1 & camera == 0 & screen == 1)
electron_camera_mic_2 <- data_file %>% filter(app_type == "electron" & duration == 2 & microphone == 1 & camera == 1 & screen == 1)
electron_micon_8 <- data_file %>% filter(app_type == "electron" & duration == 2 & microphone == 1 & camera == 0 & screen == 0)
electron_camera_8 <- data_file %>% filter(app_type == "electron" & duration == 2 & microphone == 1 & camera == 1 & screen == 0)
electron_screen_mic_8 <- data_file %>% filter(app_type == "electron" & duration == 2 & microphone == 1 & camera == 0 & screen == 1)
electron_camera_mic_8 <- data_file %>% filter(app_type == "electron" & duration == 2 & microphone == 1 & camera == 1 & screen == 1)

# web app - 2 and 8 mins and 4 modes of interaction
web_micon_2 <- data_file %>% filter(app_type == "web" & duration == 2 & microphone == 1 & camera == 0 & screen == 0)
web_camera_2 <- data_file %>% filter(app_type == "web" & duration == 2 & microphone == 1 & camera == 1 & screen == 0)
web_screen_mic_2 <- data_file %>% filter(app_type == "web" & duration == 2 & microphone == 1 & camera == 0 & screen == 1)
web_camera_mic_2 <- data_file %>% filter(app_type == "web" & duration == 2 & microphone == 1 & camera == 1 & screen == 1)
web_micon_8 <- data_file %>% filter(app_type == "web" & duration == 8 & microphone == 1 & camera == 0 & screen == 0)
web_camera_8 <- data_file %>% filter(app_type == "web" & duration == 8 & microphone == 1 & camera == 1 & screen == 0)
web_screen_mic_8 <- data_file %>% filter(app_type == "web" & duration == 8 & microphone == 1 & camera == 0 & screen == 1)
web_camera_mic_8 <- data_file %>% filter(app_type == "web" & duration == 8 & microphone == 1 & camera == 1 & screen == 1)

# normality for duration only
data_frames_normality_list_duration <- list(data_file_web_2, data_file_web_8, data_file_electron_2, data_file_electron_8)


# List of data frames
data_frames_normality_list <- list(
  electron_micon_2, electron_camera_2, electron_screen_mic_2, electron_camera_mic_2,
  electron_micon_8, electron_camera_8, electron_screen_mic_8, electron_camera_mic_8,
  web_micon_2, web_camera_2, web_screen_mic_2, web_camera_mic_2,
  web_micon_8, web_camera_8, web_screen_mic_8, web_camera_mic_8
)

# List to store p-values
p_values_list <- list()

# Apply the check_normality function on each data frame in the list
for (df in data_frames_normality_list) {
  
  print("energy")
  p_value_energy <- check_normality(df$energy, "Energy")
  p_values_list <- append(p_values_list,p_value_energy)

  print("cpu")
  p_value_cpu <- check_normality(df$cpu, "CPU")
  p_values_list <- append(p_values_list,p_value_cpu)

  print("memory")
  p_value_memory <- check_normality(df$memory, "Memory")
  p_values_list <- append(p_values_list, p_value_memory)

  print("network")
  p_value_network <- check_normality(df$network, "Network")
  p_values_list <- append(p_values_list, p_value_network)
} 

# Print the list of p-values
paste(p_values_list)

for(p in p_values_list) {
  if(p>0.05) {
    print(p)
  }
}

## 2nd part - transformed data
# checking the normality for transformed data now
# electron app first - 2 and 8 mins and 4 modes of interaction

transform_electron_micon_2 <- transform_data_file %>% filter(app_type == "electron" & duration == 2 & microphone == 1 & camera == 0 & screen == 0)
transform_electron_camera_2 <- transform_data_file %>% filter(app_type == "electron" & duration == 2 & microphone == 1 & camera == 1 & screen == 0)
transform_electron_screen_mic_2 <- transform_data_file %>% filter(app_type == "electron" & duration == 2 & microphone == 1 & camera == 0 & screen == 1)
transform_electron_camera_mic_2 <- transform_data_file %>% filter(app_type == "electron" & duration == 2 & microphone == 1 & camera == 1 & screen == 1)
transform_electron_micon_8 <- transform_data_file %>% filter(app_type == "electron" & duration == 2 & microphone == 1 & camera == 0 & screen == 0)
transform_electron_camera_8 <- transform_data_file %>% filter(app_type == "electron" & duration == 2 & microphone == 1 & camera == 1 & screen == 0)
transform_electron_screen_mic_8 <- transform_data_file %>% filter(app_type == "electron" & duration == 2 & microphone == 1 & camera == 0 & screen == 1)
transform_electron_camera_mic_8 <- transform_data_file %>% filter(app_type == "electron" & duration == 2 & microphone == 1 & camera == 1 & screen == 1)

# web app - 2 and 8 mins and 4 modes of interaction
transform_web_micon_2 <- transform_data_file %>% filter(app_type == "web" & duration == 2 & microphone == 1 & camera == 0 & screen == 0)
transform_web_camera_2 <- transform_data_file %>% filter(app_type == "web" & duration == 2 & microphone == 1 & camera == 1 & screen == 0)
transform_web_screen_mic_2 <- transform_data_file %>% filter(app_type == "web" & duration == 2 & microphone == 1 & camera == 0 & screen == 1)
transform_web_camera_mic_2 <- transform_data_file %>% filter(app_type == "web" & duration == 2 & microphone == 1 & camera == 1 & screen == 1)
transform_web_micon_8 <- transform_data_file %>% filter(app_type == "web" & duration == 8 & microphone == 1 & camera == 0 & screen == 0)
transform_web_camera_8 <- transform_data_file %>% filter(app_type == "web" & duration == 8 & microphone == 1 & camera == 1 & screen == 0)
transform_web_screen_mic_8 <- transform_data_file %>% filter(app_type == "web" & duration == 8 & microphone == 1 & camera == 0 & screen == 1)
transform_web_camera_mic_8 <- transform_data_file %>% filter(app_type == "web" & duration == 8 & microphone == 1 & camera == 1 & screen == 1)


# normality for duration only
transform_data_frames_normality_list_duration <- list(transform_data_file_web_2, transform_data_file_web_8, transform_data_file_electron_2, transform_data_file_electron_8)


# List of data frames for transformed list
transform_data_frames_normality_list <- list(
  transform_electron_micon_2, transform_electron_camera_2, transform_electron_screen_mic_2, transform_electron_camera_mic_2,
  transform_electron_micon_8, transform_electron_camera_8, transform_electron_screen_mic_8, transform_electron_camera_mic_8,
  transform_web_micon_2, transform_web_camera_2, transform_web_screen_mic_2, transform_web_camera_mic_2,
  transform_web_micon_8, transform_web_camera_8, transform_web_screen_mic_8, transform_web_camera_mic_8
)

# print(length(transform_data_frames_normality_list))

# List to store p-values
transform_p_values_list <- list()

# Apply the check_normality function on each data frame in the list
for (t_df in transform_data_frames_normality_list) {
  
  print("energy")
  p_value_energy <- check_normality(t_df$energy, "Energy")
  transform_p_values_list <- append(transform_p_values_list,p_value_energy)
  
  print("cpu")
  p_value_cpu <- check_normality(t_df$cpu, "CPU")
  transform_p_values_list <- append(transform_p_values_list,p_value_cpu)
  
  print("memory")
  p_value_memory <- check_normality(t_df$memory, "Memory")
  transform_p_values_list <- append(transform_p_values_list, p_value_memory)
  
  print("network")
  p_value_network <- check_normality(t_df$network, "Network")
  transform_p_values_list <- append(transform_p_values_list, p_value_network)
} 

paste(transform_p_values_list)
for(p in transform_p_values_list) {
  if(p>0.05) {
    print(p)
  }
}
