#' ggplot2 fill scale with complementary palette
#'
#' @param start_color Optional HEX color
#' @param recycle Whether to recycle colors if needed
#' @param div Number of hue divisions (overrides n-based split)
#' @param c Chroma (used only if start_color is NULL)
#' @param l Lightness (used only if start_color is NULL)
#' @param ... Passed to scale_fill_manual
#' @export
scale_fill_comp <- function(start_color = NULL, recycle = TRUE, div = NULL, c = 100, l = 65, ...) {
  ggplot2::discrete_scale(
    "fill", "comp",
    palette = function(n) comp_palette(n, start_color = start_color, recycle = recycle, div = div, c = c, l = l),
    ...
  )
}
