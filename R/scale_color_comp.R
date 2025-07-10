#' ggplot2 color scale with complementary palette
#'
#' @param start Optional HEX color
#' @param recycle Whether to recycle colors if needed
#' @param div Number of hue divisions (overrides n-based split)
#' @param c_val Chroma (used only if start_color is NULL)
#' @param l_val Lightness (used only if start_color is NULL)
#' @param ... Passed to scale_fill_manual
#' @export
scale_color_comp <- function(start = NULL, recycle = TRUE, div = NULL, c_val = 100, l_val = 65, ...) {
  ggplot2::discrete_scale(
    "fill", "comp",
    palette = function(n) comp_palette(n, start = start, recycle = recycle, div = div, c_val = c_val, l_val = l_val),
    ...
  )
}
