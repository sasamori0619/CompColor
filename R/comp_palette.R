#' Generate complementary color palette with optional start and recycling
#'
#' This function generates a palette that alternates between colors and their complements.
#'
#' @param n Number of colors to generate
#' @param c Chroma (default 100)
#' @param l Lightness (default 65)
#' @param start_color Optional HEX color code (e.g., "#FF0000") to set as the starting hue
#' @param recycle Whether to recycle the color pattern if n > generated palette (default TRUE)
#'
#' @return A character vector of color hex codes
#' @export
#' @examples
#' comp_palette(8, start_color = "#FF0000", recycle = TRUE)
comp_palette <- function(n, c = 100, l = 65, start_color = NULL, recycle = TRUE) {
  if (!requireNamespace("colorspace", quietly = TRUE)) {
    stop("Package 'colorspace' is required. Please install it.")
  }

  # Determine starting hue
  start_hue <- if (!is.null(start_color)) {
    rgb_val <- grDevices::col2rgb(start_color) / 255
    hcl_col <- as(colorspace::RGB(rgb_val[1], rgb_val[2], rgb_val[3]), "polarLUV")
    h <- hcl_col@coords[3]
    h %% 360
  } else {
    15
  }

  half_n <- ceiling(n / 2)
  base_hues <- (start_hue + seq(0, length.out = half_n, by = 360 / half_n)) %% 360
  base_colors <- grDevices::hcl(h = base_hues, c = c, l = l)
  comp_colors <- grDevices::hcl(h = (base_hues + 180) %% 360, c = c, l = l)

  palette_raw <- as.vector(rbind(base_colors, comp_colors))
  if (recycle && length(palette_raw) < n) {
    palette <- rep(palette_raw, length.out = n)
  } else {
    palette <- palette_raw[1:n]
  }

  return(palette)
}
