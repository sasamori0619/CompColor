#' ggplot2 fill scale with complementary palette
#'
#' @param start Optional HEX color
#' @param recycle Whether to recycle colors if needed
#' @param div Number of hue divisions (overrides n-based split)
#' @param c_val Chroma (used only if start_color is NULL)
#' @param l_val Lightness (used only if start_color is NULL)
#' @param ... Passed to scale_fill_manual
#' @export
scale_fill_comp <- function(start = NULL, recycle = TRUE, div = NULL, ...) {
  ggplot2::discrete_scale(
    "fill", "comp",
    palette = function(n) comp_palette(n, start = start, recycle = recycle, div = div),
    ...
  )
}
