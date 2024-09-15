# # Graph Screeplot of PCA complete set
# screeplot_biome <- fviz_screeplot(pca_biome, ncp = 10, linecolor = 'black', linetype = "dashed", barfill  = 'grey58', 
#                                   barcolor ='black', xlab = "PC dimensions", 
#                                   ylab = '% varicance explained',
#                                   main = 'Screeplot of PCA') +
#   theme_minimal(base_size = 11) +
#   theme(plot.title = element_text(family ="Arial", face ="bold", hjust = 0.5, size = rel(1.2), margin = margin(0,0,5,0)),
#         axis.title.y = element_text(hjust = 0.5, margin = margin(0,10,0,0), size = rel(1), color = 'black'),
#         axis.title.x = element_text(hjust = 0.5, margin = margin(10,0,0,0), size = rel(1), color = 'black'),
#         axis.text.y = element_text(family = "Arial", size = 9, color = "black", face = "bold"),
#         axis.text.x = element_text(family = "Arial", size = 10, color = "black", face = "bold"), 
#         # Set white background
#         panel.background = element_rect(fill = "white", color = NA),
#         plot.background = element_rect(fill = "white", color = NA)) +
#   geom_text(aes(x = 1:10, y = variance_expl[1:10] + 1, 
#                 label = paste0(round(variance_expl[1:10], 1), "%")),
#             size = 4, color = "black", hjust = 0.1, vjust = 0.9) +
#   ylim(0, 17)
# 
# # Check graph
# screeplot_biome
# 
# # 
# # # Graph Screeplot of PCA subset CW only
# # screeplot_biome_cw <- fviz_screeplot(pca_biome_cw, ncp = 10, linecolor = 'black', linetype = "dashed", barfill  = 'grey58', 
# #                                      barcolor ='black', xlab = "PC dimensions", 
# #                                      ylab = '% varicance explained',
# #                                      main = 'Screeplot of PCA subset "CW only"') +
# #   theme_minimal(base_size = 11) +
# #   theme(plot.title = element_text(family ="Arial", face ="bold", hjust = 0.5, size = rel(1.2), margin = margin(0,0,5,0)),
# #         axis.title.y = element_text(hjust = 0.5, margin = margin(0,10,0,0), size = rel(1), color = 'black'),
# #         axis.title.x = element_text(hjust = 0.5, margin = margin(10,0,0,0), size = rel(1), color = 'black'),
# #         axis.text.y = element_text(family = "Arial", size = 9, color = "black", face = "bold"),
# #         axis.text.x = element_text(family = "Arial", size = 10, color = "black", face = "bold"), 
# #         # Set white background
# #         panel.background = element_rect(fill = "white", color = NA),
# #         plot.background = element_rect(fill = "white", color = NA)) +
# #   geom_text(aes(x = 1:10, y = variance_expl_cw[1:10] + 1, 
# #                 label = paste0(round(variance_expl_cw[1:10], 1), "%")),
# #             size = 4, color = "black", hjust = 0.1, vjust = 0.9) +
# #   ylim(0, 17)
# # 
# # # Check graph
# # screeplot_biome_cw