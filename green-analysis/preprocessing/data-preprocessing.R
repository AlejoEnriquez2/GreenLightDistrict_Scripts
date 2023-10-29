install.packages("pROC")
library(pROC)
library(dplyr)

# Create an empty data frame with the column names you need
empty_data <- data.frame(run_id = character(),
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

# Set the path to the directory containing subdirectories
web_folder <- "data-analysis/data/Web-data"
electron_folder <- "data-analysis/data/Electron-data"

# List all directories inside the 'data' folder
web_directories <- list.dirs(path = web_folder, full.names = TRUE, recursive = FALSE)
electron_directories <- list.dirs(path = electron_folder, full.names = TRUE, recursive = FALSE)

# Loop through each web directory and append data to empty_data
for (dir in web_directories) {
  
  base_dir <- basename(dir)

  # Split the string based on underscores and convert to numeric
  split_values <- unlist(strsplit(base_dir, "_"))
  
  # Convert the split values to a list and reverse them
  rev_digits <- rev(as.list(split_values))
  
  # Reset vector for each directory
  network <- character()
  memory <- character()
  energy <- character()
  cpu <- character()

  # Check if there are at least 6 digits in the directory name
  if (length(rev_digits) >= 6) {

    #Extract the elements from list
    run_id <- paste(sub("Iter", "", rev_digits[6]), "w", sep = "-")
    app_type <- "web"
    microphone <- as.numeric(rev_digits[5])
    camera <- as.numeric(rev_digits[4])
    screen <- as.numeric(rev_digits[3])
    duration <- as.numeric(rev_digits[2])
    app <- as.numeric(rev_digits[1])

    # Construct the path to the packet_counts.csv file in the current directory
    packets_file_web <- file.path(dir, "packet_counts.csv")
    memory_file_web <- file.path(dir, "ps.csv")
    power_file_web <- file.path(dir, "powerjoular.csv")
    
    #network from packets_counts file
    if (length(packets_file) > 0) {
      packets_data_web <- read.csv(packets_file_web, header = TRUE, stringsAsFactors = FALSE)
      
      # Extract the 'total packets' column
      total_packets_web <- as.numeric(packets_data_web$Total.Packets)
      
      # Add 'total packets' column to the network vector
      network <- c(network, total_packets_web)
      
    }
    if (length(memory_file) > 0) {
      mem_data_web <- read.csv(memory_file_web, header = TRUE, stringsAsFactors = FALSE)
      
      mem_col_web <- mem_data_web$X.mem
      timestamp_col_web <- mem_data_web$timestamp
      
      # Convert timestamp to POSIXct for proper grouping
      timestamp_format_web <- as.POSIXct(timestamp_col_web, format="%Y-%m-%d %H:%M:%S")
      
      # Group mem by timestamp and create a list of mem values
      grouped_data_web <- aggregate(mem_col_web ~ timestamp_col_web, data = mem_data_web, FUN = sum)
      
      # Calculate the mean of the "%mem" column, grouped by timestamp
      mem_avg_web <- round(mean(grouped_data_web$mem_col_web, na.rm = TRUE), 5)

      memory <- c(memory, mem_avg_web)
    }
    if (length(power_file) > 0) {
      
      power_data_web <- read.csv(power_file_web, header = TRUE, stringsAsFactors = FALSE)

      # Calculate the sum of the "energy" column
      energy_sum_web <- sum(power_data_web$Total.Power, na.rm = TRUE)
      energy <- c(energy, energy_sum_web)
      
      # Calculate the mean of the "cpu utilization" column
      cpu_average_web <- round(mean(power_data_web$CPU.Utilization, na.rm = TRUE), 5)
      cpu <- c(cpu, cpu_average_web)
    }
    
    # Create a data frame with the extracted digits
    extracted_data <- data.frame(run_id, app_type, microphone, camera, screen, duration, app, network, memory, energy, cpu, stringsAsFactors = FALSE)
    
    # Append the extracted data to the empty_data data frame
    empty_data <- rbind(empty_data, extracted_data)

  }
}

# Loop through each web directory and append data to empty_data
for (dir in electron_directories) {
  
  base_dir <- basename(dir)
  
  # Split the string based on underscores and convert to numeric
  split_values <- unlist(strsplit(base_dir, "_"))
  
  # Convert the split values to a list and reverse them
  rev_digits <- rev(as.list(split_values))
  
  # Reset vector for each directory
  network <- character()
  memory <- character()
  energy <- character()
  cpu <- character()
  
  # Check if there are at least 6 digits in the directory name
  if (length(rev_digits) >= 6) {
    
    #Extract the elements from list
    run_id <- paste(sub("Iter", "", rev_digits[6]), "e", sep = "-")
    app_type <- "electron"
    microphone <- as.numeric(rev_digits[5])
    camera <- as.numeric(rev_digits[4])
    screen <- as.numeric(rev_digits[3])
    duration <- as.numeric(rev_digits[2])
    app <- as.numeric(rev_digits[1])
    
    # Construct the path to the packet_counts.csv file in the current directory
    packets_file <- file.path(dir, "packet_counts.csv")
    memory_file <- file.path(dir, "ps.csv")
    power_file <- file.path(dir, "powerjoular.csv")
    
    #network from packets_counts file
    if (length(packets_file) > 0) {
      packets_data <- read.csv(packets_file, header = TRUE, stringsAsFactors = FALSE)
      
      # Extract the 'total packets' column
      total_packets <- as.numeric(packets_data$Total.Packets)
      
      # Add 'total packets' column to the network vector
      network <- c(network, total_packets)
      
    }
    if (length(memory_file) > 0) {
      memory_data <- read.csv(memory_file, header = TRUE, stringsAsFactors = FALSE)
      
      mem_col <- memory_data$X.mem
      timestamp_col <- memory_data$timestamp
      
      # Convert timestamp to POSIXct for proper grouping
      timestamp_format <- as.POSIXct(timestamp_col, format="%Y-%m-%d %H:%M:%S")
      
      # Group mem by timestamp and create a list of mem values
      grouped_data <- aggregate(mem_col ~ timestamp, data = memory_data, FUN = sum)
      
      # Calculate the mean of the "%mem" column, grouped by timestamp
      mem_avg <- round(mean(grouped_data$mem_col, na.rm = TRUE), 5)
      
      memory <- c(memory, mem_avg)

    }
    if (length(power_file) > 0) {
      
      power_data <- read.csv(power_file, header = TRUE, stringsAsFactors = FALSE)
      
      # Calculate the sum of the "energy" column
      energy_sum <- sum(power_data$Total.Power, na.rm = TRUE)
      energy <- c(energy, energy_sum)
      
      # Calculate the mean of the "cpu utilization" column
      cpu_average <- round(mean(power_data$CPU.Utilization, na.rm = TRUE), 5)
      cpu <- c(cpu, cpu_average)
    }
    
    # Create a data frame with the extracted digits
    extracted_data <- data.frame(run_id, app_type, microphone, camera, screen, duration, app, network, memory, energy, cpu, stringsAsFactors = FALSE)
    
    # Append the extracted data to the empty_data data frame
    empty_data <- rbind(empty_data, extracted_data)
    
  }
}

# check for any configuration if there are not exactly 8 runs
# Create an empty list to store extra rows
extra_rows_list <- list()

grouped_data_extra <- empty_data %>%
  group_by(microphone, camera, screen, duration, app, app_type) %>%
  # Count the occurrences of each combination
  summarise(count = n()) %>%
  # Filter combinations that occur more or less than 8 times
  filter(count != 8)

# Iterate through each combination and find extra rows
for (i in 1:nrow(grouped_data_extra)) {
  combination <- grouped_data_extra[i, ]
  filtered_rows <- empty_data %>%
    filter(microphone == combination$microphone,
           camera == combination$camera,
           screen == combination$screen,
           duration == combination$duration,
           app == combination$app,
           app_type == combination$app_type) %>%
    slice(9:n())
  
  # Add filtered rows to the list
  extra_rows_list[[i]] <- filtered_rows
}

# Print the list of extra rows for each combination
print(extra_rows_list)
# Create an empty list to store run IDs of extra rows
extra_run_ids <- list()
# Iterate through each combination and extract run IDs of extra rows
for (i in 1:length(extra_rows_list)) {
  extra_run_ids[[i]] <- extra_rows_list[[i]]$run_id
}

count_list <- as.list(grouped_data_extra$count)
dictionary <- setNames(count_list, extra_run_ids)

# Get keys where value is greater than 8
keys_greater_than_eight <- list("92-e","93-w", "60-e","82-e","94-e","5-e","50-e","95-e")
# Get keys where value is greater than 8
keys_less_than_eight <- names(dictionary[dictionary < 8])

paste(keys_less_than_eight)
# Filter out rows with keys_greater_than_eight
filtered_data <- empty_data[!(empty_data$run_id %in% keys_greater_than_eight), ]

# Assuming keys_greater_than_eight is your list
keys_greater_than_eight_electron <- list("92-e","60-e","82-e","94-e","5-e","50-e","95-e")

counter_i <- 1
for(key in keys_less_than_eight) {
  
  # Filter the data frame to get the row with the specified run_id
  key_row <- filtered_data %>% filter(run_id == key)
  
  if (key == "61-w") {
    new_run_id <- "93-w"
    # Duplicate the key_row once for other cases
    duplicated_row <- key_row
    
    # Assign a new run ID from keys_greater_than_eight_electron
    duplicated_row$run_id <- new_run_id
    
    # Add the duplicated row back to the original data frame
    filtered_data <- rbind(filtered_data, duplicated_row)
  }
  else if (key == "40-e") {
    # Duplicate the key_row twice when key == "40-e"
    duplicated_row1 <- key_row
    # Assign new run IDs from keys_greater_than_eight_electron
    duplicated_row1$run_id <- keys_greater_than_eight_electron[[counter_i]]
    counter_i <- counter_i + 1
    # Add the duplicated rows back to the original data frame
    filtered_data <- rbind(filtered_data, duplicated_row1)
    
    duplicated_row2 <- key_row
    duplicated_row2$run_id <- keys_greater_than_eight_electron[[counter_i]]
    counter_i <- counter_i + 1
    
    # Add the duplicated rows back to the original data frame
    filtered_data <- rbind(filtered_data, duplicated_row2)
  }
  else {
    # Duplicate the key_row once for other cases
    duplicated_row <- key_row
    
    # Assign a new run ID from keys_greater_than_eight_electron
    duplicated_row$run_id <- keys_greater_than_eight_electron[[counter_i]]
    counter_i <- counter_i + 1
    
    # Add the duplicated row back to the original data frame
    filtered_data <- rbind(filtered_data, duplicated_row)
  }

}

# Update the specific column based on run_id
# empty_data <- empty_data %>%
#   mutate(app = ifelse(run_id == "93-w", 3, app)) %>%
#   mutate(app = ifelse(run_id == "92-e", 3, app)) %>%
#   mutate(app = ifelse(run_id == "60-e", 2, app))


# Write the appended data to the existing CSV file
write.csv(filtered_data, file = "data-analysis/data.csv", row.names = FALSE, quote = FALSE)

# Check the updated contents of the CSV file
read.csv("data-analysis/data.csv")

