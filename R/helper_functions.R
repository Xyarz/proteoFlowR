#' @title investigate_data
#' 
#' @param data data object, ideally a data frame

#' @export
investigate_data <- function(data) {
  head(data)
  str(data)
  class(data)
}

#' @title export_ggplot
#' 
#' @description
#' uses the ggsave function to save the passed on ggplot2 object as a png to
#' the passed path given by the file_name parameter
#' 
#'
#' @param file_name file name of the to be saved object - needs to be a string
#' @param plot_name ggplot2 object
#' @param width needs to be a numeric, e.g., 85 * (14/5)
#' @param height needs to be a numeric e.g., 85 * (14/5)

#' @export
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

#' @title generate_upset_queries
#' 
#' @description
#' iterates through the given named list and creates queries for all the individual
#' names created for an upset plot.
#' 
#' @param names a named list object
#'
#' @return queries - a list of upset plot queries
#' @export
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


#' @title exclude_rowname
#'
#' @param data an data object - ideally a data frame
#' @param str_idx the indice to be excluded, provided as a string
#'
#' @return data returns the given dataset without the provided indices
#' @export
exclude_rowname <- function(data, str_idx){
  data <- data[!(rownames(data) == str_idx), ]
  return(data)
}

