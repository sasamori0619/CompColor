#' ggplot2 fill scale with complementary palette
#'
#' @param ... Arguments passed to comp_palette and scale_fill_manual
#' @export
scale_fill_comp <- function(...) {
  ggplot2::discrete_scale("fill", "comp", comp_palette, ...)
}
