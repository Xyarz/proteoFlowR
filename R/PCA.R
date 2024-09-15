# 
# # Perform PCA on full dataset
# pca_biome <- prcomp(biome_data, center = TRUE, scale. = TRUE)
# 
# # View PCA summary
# summary(pca_biome)
# pca_summary <- summary(pca_biome)
# 
# # Perform PCA on subset CW only
# # pca_biome_cw <- prcomp(biome_data_cw, center = TRUE, scale. = TRUE)
# 
# # View PCA summary subset CW
# # summary(pca_biome_cw)
# # pca_cw_summary <- summary(pca_biome_cw)
# 
# # Extract the variance explained from the PCA object (complete set)
# variance_expl <- pca_biome$sdev^2 / sum(pca_biome$sdev^2) * 100  # Calculate percentage variance
# 
# # Extract the variance explained from the PCA object (subset cw only)
# # variance_expl_cw <- pca_biome_cw$sdev^2 / sum(pca_biome_cw$sdev^2) * 100  # Calculate percentage variance
