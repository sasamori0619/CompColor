#' ggplot2 fill scale with customizable complementary palette
#'
#' @param start_color Optional HEX color for starting hue
#' @param recycle Whether to recycle if needed
#' @param c Chroma
#' @param l Lightness
#' @param ... Other arguments to pass to discrete_scale
#' @export
scale_fill_comp <- function(start_color = NULL, recycle = TRUE, c = 100, l = 65, ...) {
  ggplot2::discrete_scale(
    "fill",
    "comp",
    palette = function(n) comp_palette(n, start_color = start_color, recycle = recycle, c = c, l = l),
    ...
  )
}
