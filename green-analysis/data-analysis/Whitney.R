library(ggplot2)
library(dplyr)
library(stats)



# Perform Mann-Whitney U Test for duration question
# for electron nd web apps for 2 mins and 8 mins - energy
mwu_result_energy_2 <- wilcox.test(data_file_web_2$energy, data_file_electron_2$energy, alternative = "two.sided")
print(mwu_result_energy_2)

# for electron and web for 8 mins
mwu_result_energy_8 <- wilcox.test(data_file_web_8$energy, data_file_electron_8$energy, alternative = "two.sided")
# Print the test result
print(mwu_result_energy_8)

# for electron nd web apps for 2 mins and 8 mins - cpu
mwu_result_cpu_2 <- wilcox.test(data_file_web_2$cpu, data_file_electron_2$cpu, alternative = "two.sided")
print(mwu_result_cpu_2)

# for electron and web for 8 mins
mwu_result_cpu_8 <- wilcox.test(data_file_web_8$cpu, data_file_electron_8$cpu, alternative = "two.sided")
print(mwu_result_cpu_8)

# For electron and web apps for 2 mins - memory
mwu_result_memory_2 <- wilcox.test(data_file_web_2$memory, data_file_electron_2$memory, alternative = "two.sided")
print(mwu_result_memory_2)

# For electron and web apps for 8 mins - memory
mwu_result_memory_8 <- wilcox.test(data_file_web_8$memory, data_file_electron_8$memory, alternative = "two.sided")
print(mwu_result_memory_8)

# For electron and web apps for 2 mins - network
mwu_result_network_2 <- wilcox.test(data_file_web_2$network, data_file_electron_2$network, alternative = "two.sided")
print(mwu_result_network_2)

# For electron and web apps for 8 mins - network
mwu_result_network_8 <- wilcox.test(data_file_web_8$network, data_file_electron_8$network, alternative = "two.sided")
print(mwu_result_network_8)

# perform test for modes of interaction

# For 2 mins duration
mwu_result_energy_2_micon <- wilcox.test(electron_micon_2$energy, web_micon_2$energy, alternative = "two.sided")
mwu_result_energy_2_camera <- wilcox.test(electron_camera_2$energy, web_camera_2$energy, alternative = "two.sided")
mwu_result_energy_2_screen_mic <- wilcox.test(electron_screen_mic_2$energy, web_screen_mic_2$energy, alternative = "two.sided")
mwu_result_energy_2_camera_mic <- wilcox.test(electron_camera_mic_2$energy, web_camera_mic_2$energy, alternative = "two.sided")

mwu_result_cpu_2_micon <- wilcox.test(electron_micon_2$cpu, web_micon_2$cpu, alternative = "two.sided")
mwu_result_cpu_2_camera <- wilcox.test(electron_camera_2$cpu, web_camera_2$cpu, alternative = "two.sided")
mwu_result_cpu_2_screen_mic <- wilcox.test(electron_screen_mic_2$cpu, web_screen_mic_2$cpu, alternative = "two.sided")
mwu_result_cpu_2_camera_mic <- wilcox.test(electron_camera_mic_2$cpu, web_camera_mic_2$cpu, alternative = "two.sided")

mwu_result_network_2_micon <- wilcox.test(electron_micon_2$network, web_micon_2$network, alternative = "two.sided")
mwu_result_network_2_camera <- wilcox.test(electron_camera_2$network, web_camera_2$network, alternative = "two.sided")
mwu_result_network_2_screen_mic <- wilcox.test(electron_screen_mic_2$network, web_screen_mic_2$network, alternative = "two.sided")
mwu_result_network_2_camera_mic <- wilcox.test(electron_camera_mic_2$network, web_camera_mic_2$network, alternative = "two.sided")

mwu_result_memory_2_micon <- wilcox.test(electron_micon_2$memory, web_micon_2$memory, alternative = "two.sided")
mwu_result_memory_2_camera <- wilcox.test(electron_camera_2$memory, web_camera_2$memory, alternative = "two.sided")
mwu_result_memory_2_screen_mic <- wilcox.test(electron_screen_mic_2$memory, web_screen_mic_2$memory, alternative = "two.sided")
mwu_result_memory_2_camera_mic <- wilcox.test(electron_camera_mic_2$memory, web_camera_mic_2$memory, alternative = "two.sided")



# Print the test results
print("Energy - 2 mins - Mic")
print(mwu_result_energy_2_micon)
print("Energy - 2 mins - Camera")
print(mwu_result_energy_2_camera)
print("Energy - 2 mins - Screen Mic")
print(mwu_result_energy_2_screen_mic)
print("Energy - 2 mins - Camera Mic")
print(mwu_result_energy_2_camera_mic)

# For 2 mins duration - CPU
print("CPU - 2 mins - Mic")
print(mwu_result_cpu_2_micon)
print("CPU - 2 mins - Camera")
print(mwu_result_cpu_2_camera)
print("CPU - 2 mins - Screen Mic")
print(mwu_result_cpu_2_screen_mic)
print("CPU - 2 mins - Camera Mic")
print(mwu_result_cpu_2_camera_mic)

# For 2 mins duration - Network
print("Network - 2 mins - Mic")
print(mwu_result_network_2_micon)
print("Network - 2 mins - Camera")
print(mwu_result_network_2_camera)
print("Network - 2 mins - Screen Mic")
print(mwu_result_network_2_screen_mic)
print("Network - 2 mins - Camera Mic")
print(mwu_result_network_2_camera_mic)

# For 2 mins duration - Memory
print("Memory - 2 mins - Mic")
print(mwu_result_memory_2_micon)
print("Memory - 2 mins - Camera")
print(mwu_result_memory_2_camera)
print("Memory - 2 mins - Screen Mic")
print(mwu_result_memory_2_screen_mic)
print("Memory - 2 mins - Camera Mic")
print(mwu_result_memory_2_camera_mic)

# For 8 mins duration
mwu_result_energy_8_micon <- wilcox.test(electron_micon_8$energy, web_micon_8$energy, alternative = "two.sided")
mwu_result_energy_8_camera <- wilcox.test(electron_camera_8$energy, web_camera_8$energy, alternative = "two.sided")
mwu_result_energy_8_screen_mic <- wilcox.test(electron_screen_mic_8$energy, web_screen_mic_8$energy, alternative = "two.sided")
mwu_result_energy_8_camera_mic <- wilcox.test(electron_camera_mic_8$energy, web_camera_mic_8$energy, alternative = "two.sided")

mwu_result_cpu_8_micon <- wilcox.test(electron_micon_8$cpu, web_micon_8$cpu, alternative = "two.sided")
mwu_result_cpu_8_camera <- wilcox.test(electron_camera_8$cpu, web_camera_8$cpu, alternative = "two.sided")
mwu_result_cpu_8_screen_mic <- wilcox.test(electron_screen_mic_8$cpu, web_screen_mic_8$cpu, alternative = "two.sided")
mwu_result_cpu_8_camera_mic <- wilcox.test(electron_camera_mic_8$cpu, web_camera_mic_8$cpu, alternative = "two.sided")

mwu_result_network_8_micon <- wilcox.test(electron_micon_8$network, web_micon_8$network, alternative = "two.sided")
mwu_result_network_8_camera <- wilcox.test(electron_camera_8$network, web_camera_8$network, alternative = "two.sided")
mwu_result_network_8_screen_mic <- wilcox.test(electron_screen_mic_8$network, web_screen_mic_8$network, alternative = "two.sided")
mwu_result_network_8_camera_mic <- wilcox.test(electron_camera_mic_8$network, web_camera_mic_8$network, alternative = "two.sided")

mwu_result_memory_8_micon <- wilcox.test(electron_micon_8$memory, web_micon_8$memory, alternative = "two.sided")
mwu_result_memory_8_camera <- wilcox.test(electron_camera_8$memory, web_camera_8$memory, alternative = "two.sided")
mwu_result_memory_8_screen_mic <- wilcox.test(electron_screen_mic_8$memory, web_screen_mic_8$memory, alternative = "two.sided")
mwu_result_memory_8_camera_mic <- wilcox.test(electron_camera_mic_8$memory, web_camera_mic_8$memory, alternative = "two.sided")


# Print the test results
print("Energy - 8 mins - Mic")
print(mwu_result_energy_8_micon)
print("Energy - 8 mins - Camera")
print(mwu_result_energy_8_camera)
print("Energy - 8 mins - Screen Mic")
print(mwu_result_energy_8_screen_mic)
print("Energy - 8 mins - Camera Mic")
print(mwu_result_energy_8_camera_mic)

# For 8 mins duration - CPU
print("CPU - 8 mins - Mic")
print(mwu_result_cpu_8_micon)
print("CPU - 8 mins - Camera")
print(mwu_result_cpu_8_camera)
print("CPU - 8 mins - Screen Mic")
print(mwu_result_cpu_8_screen_mic)
print("CPU - 8 mins - Camera Mic")
print(mwu_result_cpu_8_camera_mic)

# For 8 mins duration - Network
print("Network - 8 mins - Mic")
print(mwu_result_network_8_micon)
print("Network - 8 mins - Camera")
print(mwu_result_network_8_camera)
print("Network - 8 mins - Screen Mic")
print(mwu_result_network_8_screen_mic)
print("Network - 8 mins - Camera Mic")
print(mwu_result_network_8_camera_mic)

# For 8 mins duration - Memory
print("Memory - 8 mins - Mic")
print(mwu_result_memory_8_micon)
print("Memory - 8 mins - Camera")
print(mwu_result_memory_8_camera)
print("Memory - 8 mins - Screen Mic")
print(mwu_result_memory_8_screen_mic)
print("Memory - 8 mins - Camera Mic")
print(mwu_result_memory_8_camera_mic)

