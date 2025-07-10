#' Generate complementary color palette with optional start color, recycling, and division
#'
#' @param n Number of colors to generate
#' @param c Chroma (color intensity); ignored if start is provided
#' @param l Lightness; ignored if start is provided
#' @param start Optional HEX color code (e.g., "#FF0000") to set hue/chroma/lightness
#' @param recycle Logical; whether to recycle colors if more are needed (default TRUE)
#' @param div Optional: number of hue divisions (overrides automatic n-based spacing)
#'
#' @return Character vector of hex colors
#' @export
comp_palette <- function(n, c = 100, l = 65, start = NULL, recycle = TRUE, div = NULL) {
  if (!requireNamespace("colorspace", quietly = TRUE)) {
    stop("Package 'colorspace' is required. Please install it.")
  }

  # ===== 色相・彩度・明度の初期値設定 =====
  if (!is.null(start)) {
    rgb_val <- grDevices::col2rgb(start) / 255
    hcl_col <- as(colorspace::RGB(rgb_val[1], rgb_val[2], rgb_val[3]), "polarLUV")
    h_start <- hcl_col@coords[3] %% 360
    l <- hcl_col@coords[1]
    c <- sqrt(sum(hcl_col@coords[2:3]^2))  # chroma: sqrt(u^2 + v^2)
  } else {
    h_start <- 15  # default hue
  }

  # ===== 分割数の決定 =====
  split_n <- if (!is.null(div)) div else ceiling(n / 2)

  base_hues <- (h_start + seq(0, length.out = split_n, by = 360 / split_n)) %% 360
  base_colors <- grDevices::hcl(h = base_hues, c = c, l = l)
  comp_colors <- grDevices::hcl(h = (base_hues + 180) %% 360, c = c, l = l)

  # ===== 補色交互で統合し、必要数だけ抽出 =====
  palette_raw <- as.vector(rbind(base_colors, comp_colors))

  # ===== リサイクル対応 =====
  if (recycle && length(palette_raw) < n) {
    palette <- rep(palette_raw, length.out = n)
  } else {
    palette <- palette_raw[1:n]
  }

  return(palette)
}
