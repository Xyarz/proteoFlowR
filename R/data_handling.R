for(i in 1:length(data)){
  print(names(data)[[i]])
  print(head(data[[i]]))
  print(class(data[[i]]))
  print(str(data[[i]]))
}


biome_data <- data[["biome_data"]]
# Transpose data
biome_data <- t(biome_data)

# Subset CW only
pat_aw <- c("P097", "P098", "P099", "P100", "P101", "P102", "P103")
biome_data_cw <- biome_data[!(rownames(biome_data) %in% pat_aw), ]

