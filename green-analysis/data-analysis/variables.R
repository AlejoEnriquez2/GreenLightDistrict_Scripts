install.packages("dplyr")
library(dplyr)

#access the data file
raw_data <- ("data-analysis/data.csv")
data_file <- read.csv("data-analysis/clean-data.csv")
avg_config_data_file <- read.csv("data-analysis/avg-config-data.csv")
transform_data_file <- read.csv("data-analysis/transformed-data.csv")
data_file
avg_config_data_file
transform_data_file


data_file_2 <- data_file %>% filter(duration == 2)
data_file_8 <- data_file %>% filter(duration == 8)


# get the data for each electon app
skype_electron_data <- data_file %>% filter(app == 1 & app_type == "electron")
slack_electron_data <- data_file %>% filter(app == 2   & app_type == "electron")
discord_electron_data <- data_file %>% filter(app == 3 &  app_type == "electron")

# get the data for each electon app
skype_web_data <- data_file %>% filter(app == 1 & app_type == "web")
slack_web_data <- data_file %>% filter(app == 2   & app_type == "web")
discord_web_data <- data_file %>% filter(app == 3 &  app_type == "web")

data_file_web_2 <- data_file %>% filter(duration == 2 & app_type == "web")
data_file_web_8 <- data_file %>% filter(duration == 8 & app_type == "web")
data_file_electron_2 <- data_file %>% filter(duration == 2 & app_type == "electron")
data_file_electron_8 <- data_file %>% filter(duration == 8 & app_type == "electron")

data_file_audio_only <- data_file %>% filter(microphone == 1 & camera == 0 & screen == 0)
data_file_audio_video <- data_file %>% filter(microphone == 1 & camera == 1 & screen == 0)
data_file_audio_screen <- data_file %>% filter(microphone == 1 & camera == 0 & screen == 1)
data_file_video_screen <- data_file %>% filter(microphone == 1 & camera == 1 & screen == 1)


# tranformed data
transform_data_file_web_2 <- transform_data_file %>% filter(duration == 2 & app_type == "web")
transform_data_file_web_8 <- transform_data_file %>% filter(duration == 8 & app_type == "web")
transform_data_file_electron_2 <- transform_data_file %>% filter(duration == 2 & app_type == "electron")
transform_data_file_electron_8 <- transform_data_file %>% filter(duration == 8 & app_type == "electron")


# average data
avg_config_data_file <- read.csv("data-analysis/avg-config-data.csv") %>%
  mutate(app = ifelse(app == 1, "Skype",
                      ifelse(app == 2, "Slack",
                             ifelse(app == 3, "Discord", "Unknown"))))

avg_config_data_file_2 <- avg_config_data_file %>% filter(duration == 2)
avg_config_data_file_8 <- avg_config_data_file %>% filter(duration == 8)

avg_config_data_file_web_2 <- avg_config_data_file %>% filter(duration == 2 & app_type == "web")
avg_config_data_file_web_8 <- avg_config_data_file %>% filter(duration == 8 & app_type == "web")
avg_config_data_file_electron_2 <- avg_config_data_file %>% filter(duration == 2 & app_type == "electron")
avg_config_data_file_electron_8 <- avg_config_data_file %>% filter(duration == 8 & app_type == "electron")

