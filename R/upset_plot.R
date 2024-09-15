# Generate lists of included proteins
# biome_upset <- data[["biome_upset"]]
# Replace intensity values with binary 1 for detected and 0 for not-detected
# biome_upset[biome_upset > 0] <- 1 # Replace values > 0 with 1
# biome_upset[is.na(biome_upset) | biome_upset == 0] <- 0 # Replace NA or 0 with 0
# 
# Merge all binary results for each entity into one column for the entity based on their indices and delete single samples
# For ALU

#' @title merge_binary_res
#'
#' @param data an data object, preferably a data frame
#' @param ent_name the name of the entity to be merged, needs to be a string
#' @param max_idx the max index this entity has in the dataframe
#'
#' @return data returns the provided dataset, with the modifications made
#' @export
merge_binary_res <- function(data, ent_name, max_idx) {
  data[[paste0("Ent_", ent_name)]] <- apply(data[, c(1:max_idx)], 1, function(x) ifelse(any(x == 1), 1, 0))
  data <- data[, -c(1:max_idx)]
  colnames(data)[colnames(data) == paste0("Ent_", ent_name)] <- ent_name
  return(data)
}

#' @title get_names_and_max_idx
#'
#' @param data an data object, preferably a data frame
#'
#' @return name_frequencies returns a list object with the unique colnames and
#' there respective freqency of occurrence
#' @export
get_names_and_max_idx <- function(data) {
  name_vec <- unique(names(data))
  # Extract the base name without the numeric suffix
  base_names <- gsub("\\.\\d+", "", name_vec)

  # Create a factor with the original order of names
  ordered_base_names <- factor(base_names, levels = unique(base_names))

  # Count frequencies while preserving the order
  name_frequencies <- tapply(ordered_base_names, ordered_base_names, length)
  return(name_frequencies)
}

# ent_list <- get_names_and_max_idx(biome_upset)

# for (j in 1:length(ent_list)) {
  # biome_upset <- merge_binary_res(biome_upset, names(ent_list)[[j]], ent_list[[j]])
# }

# biome_upset <- biome_upset[apply(biome_upset, 1, function(row) !all(row == 0)), ]

#' @title custom_upset_plot
#'
#' @param data a data object, preferably a data frame object
#' @param query_non_acute a concatenated String vector of names to be displayed,
#' excluding the non acute wounds
#' @param title a title for the ggplot to be provided
#'
#' @return upset_plot a ggplot2 object, which contains an upset plot
#' @export
custom_upset_plot <- function(
    data,
    query_non_acute,
    title
    ) {
  query_list <- generate_upset_queries(names(data))
  queries <- c(
    list(
      upset_query(
        intersect = names(data),
        color = "steelblue",
        fill = "steelblue",
        only_components = c("intersections_matrix", "Intersection size")
      ),
      upset_query(
        intersect = query_non_acute,
        color = "seagreen",
        fill = "seagreen",
        only_components = c("intersections_matrix", "Intersection size")
      )
    ),
    query_list # Add pre-existing queries
  )
  upset_plot <- upset(data,
    names(data),
    base_annotations = list(
      "Intersection size" = intersection_size(
        text_colors = c(on_background = "black", on_bar = "white"),
        text = list(
          fontface = "bold",
          size = 3
        ),
        mapping = aes(fill = "bars_color", color = "black")
      ) +
        annotate("text",
          x = Inf, y = Inf,
          label = paste("Total:", nrow(data)),
          vjust = 1.5, hjust = 1.1
        ) +
        annotate("rect",
          xmin = 28.4, xmax = 34.6, ymin = -15, ymax = 150,
          fill = NA, color = "red", size = 1
        ) +
        annotate("text",
          x = Inf, y = Inf,
          label = paste("Uniquely identified proteins"),
          size = 3.5,
          fontface = "bold",
          color = "red",
          vjust = 19,
          hjust = 1.0
        ) +
        ylab("Intersection size") +
        scale_fill_manual(values = c("bars_color" = "gray58"), guide = "none") +
        theme(plot.background = element_rect(color = "black"))
    ),
    queries = queries,
    name = title,
    width_ratio = 0.1,
    height_ratio = 1,
    sort_intersections_by = c("degree", "cardinality"),
    wrap = TRUE,
    min_size = 4,
    set_sizes = (
      upset_set_size(filter_intersections = TRUE)
      + theme(axis.text.x = element_text(size = 8, angle = 90, face = "bold"))
        + geom_text(aes(label = ..count..), stat = "count", vjust = 0.4, hjust = -0.25, color = "white", size = 3))
  )

  return(upset_plot)
}


# upset_plot_biome <- custom_upset_plot(
#   data = biome_upset,
#   query_non_acute = c("ALU", "VLU", "MIX", "PG", "WHD"),
#   title = "Core vs. Unique Proteins"
# )
# 
# upset_plot_biome
