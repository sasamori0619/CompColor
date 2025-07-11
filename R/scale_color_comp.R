#' ggplot2 color scale with complementary palette
#'
#' @param start Optional HEX color
#' @param div Number of hue divisions (overrides n-based split)
#' @param ... Passed to scale_fill_manual
#' @export
scale_color_comp <- function(start = NULL, div = NULL, skip = NULL, ...) {
  ggplot2::discrete_scale(
    "colour", "comp",
    palette = function(n) comp_palette(n, start = start,  div = div, skip = skip),
    ...
  )
}
