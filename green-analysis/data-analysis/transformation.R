library(dplyr)
install.packages("bestNormalize")
library(bestNormalize)

# Create data frame with the same structure as data_file
transform_data <- data_file

print(transform_data)

# Apply Box-Cox transformation to dependant variables
columns_to_transform <- c("memory", "energy", "cpu", "network")

for (col in columns_to_transform) {
  
  bc_result <- boxcox(data_file[[col]])
  print(bc_result)
  lambda <- bc_result$lambda
  
  if (lambda == 0) {
    transformed_column <- log(data_file[[col]])
  } else {
    transformed_column <- (data_file[[col]]^lambda - 1) / lambda
  }
  
  transform_data[[col]] <- transformed_column
}

# View the updated transform_data data frame
print(transform_data)

# Write the transformed data to the existing CSV file
write.csv(transform_data, file = "data-analysis/transformed-data.csv", row.names = FALSE, quote = FALSE)

# Check the updated contents of the CSV file
read.csv("data-analysis/transformed-data.csv")
