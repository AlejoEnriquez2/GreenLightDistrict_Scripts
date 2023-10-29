install.packages("ggplot2")
install.packages("dplyr")
install.packages("stats")
library(ggplot2)
library(dplyr)
library(stats)


data_file <- read.csv("data-analysis/clean-data.csv") %>%
  mutate(app = ifelse(app == 1, "Skype",
                      ifelse(app == 2, "Slack",
                             ifelse(app == 3, "Discord", "Unknown"))))

data_file_2 <- data_file %>% filter(duration == 2)
data_file_8 <- data_file %>% filter(duration == 8)

## Histograms
# energy - 2 mins
hist_energy_2 <- ggplot(data = data_file_2, aes(x = app, y = energy, fill = factor(app_type))) +
  geom_bar(stat = "identity", position = "dodge") +
  xlab("Apps") +
  ylab("Energy") +
  ggtitle("Energy Consumption for Duration = 2") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#7DCEA0")) +
  theme_minimal()

hist_energy_2

#energy - 8 mins
hist_energy_8 <- ggplot(data = data_file_8, aes(x = app, y = energy, fill = factor(app_type))) +
  geom_bar(stat = "identity", position = "dodge") +
  xlab("Apps") +
  ylab("Energy") +
  ggtitle("Energy Consumption for Duration = 8") +
  scale_fill_manual(values = c("electron" = "#C39BD3", "web" = "#E59866")) +
  theme_minimal()

hist_energy_8

# cpu - 2 mins
hist_cpu_2 <- ggplot(data = data_file_2, aes(x = app, y = cpu, fill = factor(app_type))) +
  geom_bar(stat = "identity", position = "dodge") +
  xlab("Apps") +
  ylab("CPU") +
  ggtitle("CPU Usage for Duration = 2") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#7DCEA0")) +
  theme_minimal()

hist_cpu_2

# cpu - 8 mins
hist_cpu_8 <- ggplot(data = data_file_8, aes(x = app, y = cpu, fill = factor(app_type))) +
  geom_bar(stat = "identity", position = "dodge") +
  xlab("Apps") +
  ylab("CPU") +
  ggtitle("CPU Usage for Duration = 8") +
  scale_fill_manual(values = c("electron" = "#C39BD3", "web" = "#E59866")) +
  theme_minimal()

hist_cpu_8

# mem - 2 mins
hist_mem_2 <- ggplot(data = data_file_2, aes(x = app, y = memory, fill = factor(app_type))) +
  geom_bar(stat = "identity", position = "dodge") +
  xlab("Apps") +
  ylab("Memory") +
  ggtitle("Memory Usage for Duration = 2") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#7DCEA0")) +
  theme_minimal()
hist_mem_2

# mem - 8 mins
hist_mem_8 <- ggplot(data = data_file_8, aes(x = app, y = memory, fill = factor(app_type))) +
  geom_bar(stat = "identity", position = "dodge") +
  xlab("Apps") +
  ylab("Memory") +
  ggtitle("Memory Usage for Duration = 8") +
  scale_fill_manual(values = c("electron" = "#C39BD3", "web" = "#E59866")) +
  theme_minimal()
hist_mem_8

# network - 2 mins
hist_net_2 <- ggplot(data = data_file_2, aes(x = app, y = network, fill = factor(app_type))) +
  geom_bar(stat = "identity", position = "dodge") +
  xlab("Apps") +
  ylab("Network") +
  ggtitle("Network Usage for Duration = 2") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#7DCEA0")) +
  theme_minimal()
hist_net_2

# mem - 8 mins
hist_net_8 <- ggplot(data = data_file_8, aes(x = app, y = network, fill = factor(app_type))) +
  geom_bar(stat = "identity", position = "dodge") +
  xlab("Apps") +
  ylab("Network") +
  ggtitle("Network Usage for Duration = 8") +
  scale_fill_manual(values = c("electron" = "#C39BD3", "web" = "#E59866")) +
  theme_minimal()
hist_net_8

# Save the plot to the "plots" directory
ggsave("graphs/hist_energy_2.png", hist_energy_2)
ggsave("graphs/hist_energy_8.png", hist_energy_8)
ggsave("graphs/hist_cpu_2.png", hist_cpu_2)
ggsave("graphs/hist_cpu_8.png", hist_cpu_8)
ggsave("graphs/hist_mem_2.png", hist_mem_2)
ggsave("graphs/hist_mem_8.png", hist_mem_8)
ggsave("graphs/hist_net_2.png", hist_net_2)
ggsave("graphs/hist_net_8.png", hist_net_8)

## Scatter Plots

# Scatterplot for the different apps
scatter_energy_duration <- ggplot(data = data_file, aes(x = as.factor(duration), y = energy, color = app_type)) +
  geom_point(size = 3) +
  labs(x = "Duration (mins)", y = "Energy Consumption [J]", title = "Energy Consumption vs. Duration") +
  scale_color_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A")) +
  geom_jitter()

scatter_energy_duration
ggsave("graphs/scatter/scatter_energy_duration.png", scatter_energy_duration)

# Memory
scatter_memroy_duration <- ggplot(data = data_file, aes(x = as.factor(duration), y = memory, color = app_type)) +
  geom_point(size = 3) +
  labs(x = "Duration (mins)", y = "Memory Usage [%]", title = "Memory Usage vs. Duration") +
  scale_color_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A")) +
  geom_jitter()

scatter_memroy_duration
ggsave("graphs/scatter/scatter_memroy_duration.png", scatter_memroy_duration)


# CPU
scatter_cpu_duration <- ggplot(data = data_file, aes(x = as.factor(duration), y = cpu, color = app_type)) +
  geom_point(size = 3) +
  labs(x = "Duration (mins)", y = "CPU Usage [%]", title = "CPU Usage vs. Duration") +
  scale_color_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A")) +
  geom_jitter()

scatter_cpu_duration
ggsave("graphs/scatter/scatter_cpu_duration.png", scatter_cpu_duration)


# Network
scatter_network_duration <- ggplot(data = data_file, aes(x = as.factor(duration), y = network, color = app_type)) +
  geom_point(size = 3) +
  labs(x = "Duration (mins)", y = "Number of TCP & UDP Packets", title = "Network Packets vs. Duration") +
  scale_color_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A")) +
  geom_jitter()

scatter_network_duration
ggsave("graphs/scatter/scatter_network_duration.png", scatter_network_duration)


## Violin Plots
# energy consumption for Electron-based apps versus Web apps

violin_plot_energy <- ggplot(data = data_file, aes(x = app_type, y = energy, fill = app_type)) +
  geom_violin() +
  labs(x = "App Type", y = "Energy Consumption [J]", title = "Distribution of Energy Consumption for Electron vs. Web Apps") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A"))

violin_plot_energy
ggsave("graphs/violin/violin_plot_energy.png", violin_plot_energy)

# Box-Violin
violin_box_plot_energy <- ggplot(data = data_file, aes(x = app_type, y = energy, fill = app_type)) +
  geom_violin() +
  labs(x = "App Type", y = "Energy Consumption [J]", title = "Distribution of Energy Consumption for Electron vs. Web Apps") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A")) +
  geom_boxplot(width=.1, alpha=.5, position=position_dodge(.9)) +
  stat_summary(fun=mean, geom="point", shape="diamond", size=3, color="black")

violin_box_plot_energy
ggsave("graphs/violin/violin_box_plot_energy.png", violin_box_plot_energy)

# Perfomance metrics
# Violin Plot for CPU Consumption
violin_plot_cpu <- ggplot(data = data_file, aes(x = app_type, y = cpu, fill = app_type)) +
  geom_violin() +
  labs(x = "App Type", y = "CPU Usage[%]", title = "CPU Usage for Electron vs. Web Apps") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A"))

violin_plot_cpu
ggsave("graphs/violin/violin_plot_cpu.png", violin_plot_cpu)

# Box-Violin for CPU Consumption
violin_box_plot_cpu <- ggplot(data = data_file, aes(x = app_type, y = cpu, fill = app_type)) +
  geom_violin() +
  labs(x = "App Type",y = "CPU Usage[%]", title = "CPU Usage for Electron vs. Web Apps") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A")) +
  geom_boxplot(width=.1, alpha=.5, position=position_dodge(.9)) +
  stat_summary(fun=mean, geom="point", shape="diamond", size=3, color="black")

violin_box_plot_cpu
ggsave("graphs/violin/violin_box_plot_cpu.png", violin_box_plot_cpu)

# Violin Plot for Memory Consumption
violin_plot_memory <- ggplot(data = data_file, aes(x = app_type, y = memory, fill = app_type)) +
  geom_violin() +
  labs(x = "App Type", y = "Memory Usage[%]", title = "Memory Usage[%] for Electron vs. Web Apps") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A"))

violin_plot_memory
ggsave("graphs/violin/violin_plot_memory.png", violin_plot_memory)

# Box-Violin for Memory Consumption
violin_box_plot_memory <- ggplot(data = data_file, aes(x = app_type, y = memory, fill = app_type)) +
  geom_violin() +
  labs(x = "App Type", y = "Memory Usage[%]", title = "Memory Usage[%] for Electron vs. Web Apps") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A")) +
  geom_boxplot(width=.1, alpha=.5, position=position_dodge(.9)) +
  stat_summary(fun=mean, geom="point", shape="diamond", size=3, color="black")

violin_box_plot_memory
ggsave("graphs/violin/violin_box_plot_memory.png", violin_box_plot_memory)

# Violin Plot for Network Consumption
violin_plot_network <- ggplot(data = data_file, aes(x = app_type, y = network, fill = app_type)) +
  geom_violin() +
  labs(x = "App Type", y = "TCP & UDP  Packets", title = "Network Packets for Electron vs. Web Apps") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A"))

violin_plot_network
ggsave("graphs/violin/violin_plot_network.png", violin_plot_network)

# Box-Violin for Network Consumption
violin_box_plot_network <- ggplot(data = data_file, aes(x = app_type, y = network, fill = app_type)) +
  geom_violin() +
  labs(x = "App Type", y = "TCP & UDP Packets", title = "Network Packets for Electron vs. Web Apps") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A")) +
  geom_boxplot(width=.1, alpha=.5, position=position_dodge(.9)) +
  stat_summary(fun=mean, geom="point", shape="diamond", size=3, color="black")

violin_box_plot_network
ggsave("graphs/violin/violin_box_plot_network.png", violin_box_plot_network)






## 8 mins duration
# Box-Violin
violin_box_plot_8_energy <- ggplot(data = data_file_8, aes(x = app_type, y = energy, fill = app_type)) +
  geom_violin() +
  labs(x = "App Type", y = "Energy Consumption [J]", title = "Energy Consumption for Electron vs. Web Apps for 8 minutes meeting") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A")) +
  geom_boxplot(width=.1, alpha=.5, position=position_dodge(.9)) +
  stat_summary(fun=mean, geom="point", shape="diamond", size=3, color="black")

violin_box_plot_8_energy
ggsave("graphs/violin/violin_box_plot_8_energy.png", violin_box_plot_8_energy)

# Box-Violin Plot for CPU Consumption (8 minutes duration)
violin_box_plot_8_cpu <- ggplot(data = data_file_8, aes(x = app_type, y = cpu, fill = app_type)) +
  geom_violin() +
  labs(x = "App Type", y = "CPU Usage[%]", title = "CPU Usage for Electron vs. Web Apps for 8 minutes meeting") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A")) +
  geom_boxplot(width=.1, alpha=.5, position=position_dodge(.9)) +
  stat_summary(fun=mean, geom="point", shape="diamond", size=3, color="black")

violin_box_plot_8_cpu
ggsave("graphs/violin/violin_box_plot_8_cpu.png", violin_box_plot_8_cpu)

# Box-Violin Plot for Memory Consumption (8 minutes duration)
violin_box_plot_8_memory <- ggplot(data = data_file_8, aes(x = app_type, y = memory, fill = app_type)) +
  geom_violin() +
  labs(x = "App Type", y = "Memory Usage[%]", title = "Memory Usage[%] for Electron vs. Web Apps for 8 minutes meeting") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A")) +
  geom_boxplot(width=.1, alpha=.5, position=position_dodge(.9)) +
  stat_summary(fun=mean, geom="point", shape="diamond", size=3, color="black")

violin_box_plot_8_memory
ggsave("graphs/violin/violin_box_plot_8_memory.png", violin_box_plot_8_memory)


# Box-Violin Plot for Network Consumption (8 minutes duration)
violin_box_plot_8_network <- ggplot(data = data_file_8, aes(x = app_type, y = network, fill = app_type)) +
  geom_violin() +
  labs(x = "App Type", y = "Number of TCP & UDP Packets", title = "Network Packets for Electron vs. Web Apps for 8 minutes meeting") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A")) +
  geom_boxplot(width=.1, alpha=.5, position=position_dodge(.9)) +
  stat_summary(fun=mean, geom="point", shape="diamond", size=3, color="black")

violin_box_plot_8_network
ggsave("graphs/violin/violin_box_plot_8_network.png", violin_box_plot_8_network)





## Modes of interaction

# Energy

violin_plot_energy_audio_only <- ggplot(data = data_file_audio_only, aes(x = app_type, y = energy, fill = app_type)) +
  geom_violin() +
  labs(x = "App Type", y = "Energy Consumption [J]", title = "AudioOnly - Energy Consumption for Electron vs. Web Apps") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A"))

violin_plot_energy_audio_only
ggsave("graphs/violin/violin_plot_energy_audio_only.png", violin_plot_energy_audio_only)

# Box-Violin
violin_box_plot_energy_audio_only <- ggplot(data = data_file_audio_only, aes(x = app_type, y = energy, fill = app_type)) +
  geom_violin() +
  labs(x = "App Type", y = "Energy Consumption [J]", title = "AudioOnly - Energy Consumption for Electron vs. Web Apps") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A")) +
  geom_boxplot(width=.1, alpha=.5, position=position_dodge(.9)) +
  stat_summary(fun=mean, geom="point", shape="diamond", size=3, color="black")

violin_box_plot_energy_audio_only
ggsave("graphs/violin/violin_box_plot_energy_audio_only.png", violin_box_plot_energy_audio_only)



# Energy
# Audio Video
violin_plot_energy_audio_video <- ggplot(data = data_file_audio_video, aes(x = app_type, y = energy, fill = app_type)) +
  geom_violin() +
  labs(x = "App Type", y = "Energy Consumption [J]", title = "AudioVideo - Energy Consumption for Electron vs. Web Apps") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A"))

violin_plot_energy_audio_video
ggsave("graphs/violin/violin_plot_energy_audio_video.png", violin_plot_energy_audio_video)

# Box-Violin
violin_box_plot_energy_audio_video <- ggplot(data = data_file_audio_video, aes(x = app_type, y = energy, fill = app_type)) +
  geom_violin() +
  labs(x = "App Type", y = "Energy Consumption [J]", title = "AudioVideo - Energy Consumption for Electron vs. Web Apps") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A")) +
  geom_boxplot(width=.1, alpha=.5, position=position_dodge(.9)) +
  stat_summary(fun=mean, geom="point", shape="diamond", size=3, color="black")

violin_box_plot_energy_audio_video
ggsave("graphs/violin/violin_box_plot_energy_audio_video.png", violin_box_plot_energy_audio_video)


# Energy
#AudioScreen
violin_plot_energy_audio_screen <- ggplot(data = data_file_audio_screen, aes(x = app_type, y = energy, fill = app_type)) +
  geom_violin() +
  labs(x = "App Type", y = "Energy Consumption [J]", title = "AudioScreen - Energy Consumption for Electron vs. Web Apps") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A"))

violin_plot_energy_audio_screen
ggsave("graphs/violin/violin_plot_energy_audio_screen.png", violin_plot_energy_audio_screen)

# Box-Violin
violin_box_plot_energy_audio_screen <- ggplot(data = data_file_audio_screen, aes(x = app_type, y = energy, fill = app_type)) +
  geom_violin() +
  labs(x = "App Type", y = "Energy Consumption [J]", title = "AudioScreen - Energy Consumption for Electron vs. Web Apps") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A")) +
  geom_boxplot(width=.1, alpha=.5, position=position_dodge(.9)) +
  stat_summary(fun=mean, geom="point", shape="diamond", size=3, color="black")

violin_box_plot_energy_audio_screen
ggsave("graphs/violin/violin_box_plot_energy_audio_screen.png", violin_box_plot_energy_audio_screen)


# Energy
#VideoScreen
violin_plot_energy_video_screen <- ggplot(data = data_file_video_screen, aes(x = app_type, y = energy, fill = app_type)) +
  geom_violin() +
  labs(x = "App Type", y = "Energy Consumption [J]", title = "VideoScreen - Energy Consumption for Electron vs. Web Apps") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A"))

violin_plot_energy_video_screen
ggsave("graphs/violin/violin_plot_energy_video_screen.png", violin_plot_energy_video_screen)

# Box-Violin
violin_box_plot_energy_video_screen <- ggplot(data = data_file_video_screen, aes(x = app_type, y = energy, fill = app_type)) +
  geom_violin() +
  labs(x = "App Type", y = "Energy Consumption [J]", title = "VideoScreen - Energy Consumption for Electron vs. Web Apps") +
  scale_fill_manual(values = c("electron" = "#5DADE2", "web" = "#F1948A")) +
  geom_boxplot(width=.1, alpha=.5, position=position_dodge(.9)) +
  stat_summary(fun=mean, geom="point", shape="diamond", size=3, color="black")

violin_box_plot_energy_video_screen
ggsave("graphs/violin/violin_box_plot_energy_video_screen.png", violin_box_plot_energy_video_screen)






