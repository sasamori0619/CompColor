#' ggplot2 color scale with complementary palette
#'
#' @param ... Arguments passed to comp_palette and scale_color_manual
#' @export
scale_color_comp <- function(...) {
  ggplot2::discrete_scale("colour", "comp", comp_palette, ...)
}
