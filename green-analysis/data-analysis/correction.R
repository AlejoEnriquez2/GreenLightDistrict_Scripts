
p_values_data
p_values_mode

# Perform Benjamini-Hochberg correction on p-values
corrected_p_values <- p.adjust(p_values_data$X.0.0105529960888909., method = "BH")


# Add corrected p-values to the data frame
p_values_data$NA_character_. <- corrected_p_values


# Perform Benjamini-Hochberg correction on p-values
corrected_p_values_mode <- p.adjust(p_values_mode$X.0.0280839143042824., method = "BH")

# Add corrected p-values to the data frame
p_values_mode$NA_character_. <- corrected_p_values_mode


# Write the appended data to the existing CSV file
write.csv(p_values_data, file = "data-analysis/p-values-duration.csv", row.names = FALSE, quote = FALSE)

# Check the updated contents of the CSV file
read.csv("data-analysis/p-values-duration.csv")

# Write the appended data to the existing CSV file
write.csv(p_values_mode, file = "data-analysis/p-values-mode.csv", row.names = FALSE, quote = FALSE)

# Check the updated contents of the CSV file
read.csv("data-analysis/p-values-mode.csv")
