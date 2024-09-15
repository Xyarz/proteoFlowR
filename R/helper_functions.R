investigate_data <- function(data) {
  head(data)
  str(data)
  class(data)
}

export_ggplot <- function(file_name, plot_name, width, height) {
  ggsave(
    file_name,
    plot = plot_name,
    device = "png",
    path = NULL,
    dpi = 600,
    limitsize = TRUE,
    bg = NULL,
    create.dir = FALSE,
    width = width,
    height = height,
    units = "mm"
  )
}

generate_upset_queries <- function(names) {
  queries <- lapply(names, function(name) {
    upset_query(
      intersect = c(name),
      color = 'salmon3',
      fill = 'salmon2',
      only_components = c('intersections_matrix', 'Intersection size')
    )
  })
  return(queries)
}


exclude_rowname <- function(data, str_idx){
  data <- data[!(rownames(data) == str_idx), ]
  return(data)
}

