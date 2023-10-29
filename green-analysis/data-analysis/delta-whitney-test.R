library(ggplot2)
library(dplyr)
library(stats)

p_values_data <- data.frame(test_dataframe = character(),
                            whitney_p_value = character(),
                            corrected_p_value = character(),
                            delta = character(),
                            stringsAsFactors = FALSE)

p_values_mode <- data.frame(test_dataframe = character(),
                            whitney_p_value = character(),
                            corrected_p_value = character(),
                            delta = character(),
                            stringsAsFactors = FALSE)


# Function to perform Wilcoxon rank-sum test and add results to p_values_data data frame
perform_wilcox_test <- function(test_name, group1, group2) {
  test_result <- wilcox.test(group1, group2, alternative = "two.sided")
  n1 <- length(group1)
  n2 <- length(group2)
  u1 <- sum(outer(group1, group2, `<`))
  u2 <- sum(outer(group1, group2, `>`))
  
  delta <- (u1 - u2) / (n1 * n2)
  p_values_mode <<- rbind(p_values_mode, c(test_name, as.character(test_result$p.value), NA, delta))
  
}

# Function to perform Wilcoxon rank-sum test and add results to p_values_data data frame
perform_wilcox_cliff_duration <- function(test_name, group1, group2) {
  test_result <- wilcox.test(group1, group2, alternative = "two.sided")
  n1 <- length(group1)
  n2 <- length(group2)
  u1 <- sum(outer(group1, group2, `<`))
  u2 <- sum(outer(group1, group2, `>`))
  
  delta <- (u1 - u2) / (n1 * n2)
  p_values_data <<- rbind(p_values_data, c(test_name, as.character(test_result$p.value), NA, delta))
  
}

# For duration and web/electron - for p_values_data
perform_wilcox_cliff_duration("mwu_result_cpu_2", data_file_web_2$cpu, data_file_electron_2$cpu)
perform_wilcox_cliff_duration("mwu_result_cpu_8", data_file_web_8$cpu, data_file_electron_8$cpu)
perform_wilcox_cliff_duration("mwu_result_memory_2", data_file_web_2$memory, data_file_electron_2$memory)
perform_wilcox_cliff_duration("mwu_result_memory_8", data_file_web_8$memory, data_file_electron_8$memory)
perform_wilcox_cliff_duration("mwu_result_network_2", data_file_web_2$network, data_file_electron_2$network)
perform_wilcox_cliff_duration("mwu_result_network_8", data_file_web_8$network, data_file_electron_8$network)
perform_wilcox_cliff_duration("mwu_result_energy_2", data_file_web_2$energy, data_file_electron_2$energy)
perform_wilcox_cliff_duration("mwu_result_energy_8", data_file_web_8$energy, data_file_electron_8$energy)



# For 2 mins duration - Energy
perform_wilcox_test("mwu_result_energy_2_micon", electron_micon_2$energy, web_micon_2$energy)
perform_wilcox_test("mwu_result_energy_2_camera", electron_camera_2$energy, web_camera_2$energy)
perform_wilcox_test("mwu_result_energy_2_screen_mic", electron_screen_mic_2$energy, web_screen_mic_2$energy)
perform_wilcox_test("mwu_result_energy_2_camera_mic", electron_camera_mic_2$energy, web_camera_mic_2$energy)

# For 2 mins duration - CPU
perform_wilcox_test("mwu_result_cpu_2_micon", electron_micon_2$cpu, web_micon_2$cpu)
perform_wilcox_test("mwu_result_cpu_2_camera", electron_camera_2$cpu, web_camera_2$cpu)
perform_wilcox_test("mwu_result_cpu_2_screen_mic", electron_screen_mic_2$cpu, web_screen_mic_2$cpu)
perform_wilcox_test("mwu_result_cpu_2_camera_mic", electron_camera_mic_2$cpu, web_camera_mic_2$cpu)

# For 2 mins duration - Network
perform_wilcox_test("mwu_result_network_2_micon", electron_micon_2$network, web_micon_2$network)
perform_wilcox_test("mwu_result_network_2_camera", electron_camera_2$network, web_camera_2$network)
perform_wilcox_test("mwu_result_network_2_screen_mic", electron_screen_mic_2$network, web_screen_mic_2$network)
perform_wilcox_test("mwu_result_network_2_camera_mic", electron_camera_mic_2$network, web_camera_mic_2$network)

# For 2 mins duration - Memory
perform_wilcox_test("mwu_result_memory_2_micon", electron_micon_2$memory, web_micon_2$memory)
perform_wilcox_test("mwu_result_memory_2_camera", electron_camera_2$memory, web_camera_2$memory)
perform_wilcox_test("mwu_result_memory_2_screen_mic", electron_screen_mic_2$memory, web_screen_mic_2$memory)
perform_wilcox_test("mwu_result_memory_2_camera_mic", electron_camera_mic_2$memory, web_camera_mic_2$memory)

# For 8 mins duration - Energy
perform_wilcox_test("mwu_result_energy_8_micon", electron_micon_8$energy, web_micon_8$energy)
perform_wilcox_test("mwu_result_energy_8_camera", electron_camera_8$energy, web_camera_8$energy)
perform_wilcox_test("mwu_result_energy_8_screen_mic", electron_screen_mic_8$energy, web_screen_mic_8$energy)
perform_wilcox_test("mwu_result_energy_8_camera_mic", electron_camera_mic_8$energy, web_camera_mic_8$energy)

# For 8 mins duration - CPU
perform_wilcox_test("mwu_result_cpu_8_micon", electron_micon_8$cpu, web_micon_8$cpu)
perform_wilcox_test("mwu_result_cpu_8_camera", electron_camera_8$cpu, web_camera_8$cpu)
perform_wilcox_test("mwu_result_cpu_8_screen_mic", electron_screen_mic_8$cpu, web_screen_mic_8$cpu)
perform_wilcox_test("mwu_result_cpu_8_camera_mic", electron_camera_mic_8$cpu, web_camera_mic_8$cpu)

# For 8 mins duration - Network
perform_wilcox_test("mwu_result_network_8_micon", electron_micon_8$network, web_micon_8$network)
perform_wilcox_test("mwu_result_network_8_camera", electron_camera_8$network, web_camera_8$network)
perform_wilcox_test("mwu_result_network_8_screen_mic", electron_screen_mic_8$network, web_screen_mic_8$network)
perform_wilcox_test("mwu_result_network_8_camera_mic", electron_camera_mic_8$network, web_camera_mic_8$network)

# For 8 mins duration - Memory
perform_wilcox_test("mwu_result_memory_8_micon", electron_micon_8$memory, web_micon_8$memory)
perform_wilcox_test("mwu_result_memory_8_camera", electron_camera_8$memory, web_camera_8$memory)
perform_wilcox_test("mwu_result_memory_8_screen_mic", electron_screen_mic_8$memory, web_screen_mic_8$memory)
perform_wilcox_test("mwu_result_memory_8_camera_mic", electron_camera_mic_8$memory, web_camera_mic_8$memory)

