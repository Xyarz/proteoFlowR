
# Extract list of unique proteins (IDs) from binary input matrix for upset plot
##########
# Find proteins uniquely present in VLU
VLU_unique <- biome_upset[biome_upset[, "VLU"] == 1 & 
                            rowSums(biome_upset[, -which(colnames(biome_upset) == "VLU")]) == 0, ]

# Extract row names & export to csv file
VLU_unique_ID <- data.frame(rownames(VLU_unique))
write.csv(VLU_unique_ID, file = "VLU_unique_ID.csv", row.names = FALSE)

# Find proteins uniquely present in AW
AW_unique <- biome_upset[biome_upset[, "AW"] == 1 & 
                           rowSums(biome_upset[, -which(colnames(biome_upset) == "AW")]) == 0, ]

# Extract row names & export to csv file
AW_unique_ID <- data.frame(rownames(AW_unique))
write.csv(AW_unique_ID, file = "AW_unique_ID.csv", row.names = FALSE)

# Find proteins uniquely present in PG
PG_unique <- biome_upset[biome_upset[, "PG"] == 1 & 
                           rowSums(biome_upset[, -which(colnames(biome_upset) == "PG")]) == 0, ]

# Extract row names & export to csv file
PG_unique_ID <- data.frame(rownames(PG_unique))
write.csv(PG_unique_ID, file = "PG_unique_ID.csv", row.names = FALSE)

# Find proteins uniquely present in MIX
MIX_unique <- biome_upset[biome_upset[, "MIX"] == 1 & 
                            rowSums(biome_upset[, -which(colnames(biome_upset) == "MIX")]) == 0, ]

# Extract row names & export to csv file
MIX_unique_ID <- data.frame(rownames(MIX_unique))
write.csv(MIX_unique_ID, file = "MIX_unique_ID.csv", row.names = FALSE)

# Find proteins uniquely present in WHD
WHD_unique <- biome_upset[biome_upset[, "WHD"] == 1 & 
                            rowSums(biome_upset[, -which(colnames(biome_upset) == "WHD")]) == 0, ]

# Extract row names & export to csv file
WHD_unique_ID <- data.frame(rownames(WHD_unique))
write.csv(WHD_unique_ID, file = "WHD_unique_ID.csv", row.names = FALSE)

# Find proteins uniquely present in ALU
ALU_unique <- biome_upset[biome_upset[, "ALU"] == 1 & 
                            rowSums(biome_upset[, -which(colnames(biome_upset) == "ALU")]) == 0, ]

# Extract row names & export to csv file
ALU_unique_ID <- data.frame(rownames(ALU_unique))
write.csv(ALU_unique_ID, file = "ALU_unique_ID.csv", row.names = FALSE)