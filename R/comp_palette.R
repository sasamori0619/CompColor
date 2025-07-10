#' Generate complementary palette with div-based hue division and custom ordering
#'
#' @param n Number of colors required (must be >= 1)
#' @param start Optional HEX color. If NULL, default color (Hue=15, C=100, L=65) used.
#' @param div Number of hue divisions (default = 8). Must be >= 1.
#'
#' @return Character vector of length div * 2 containing alternating base and complementary colors.
#' @export
comp_palette <- function(n, start = NULL, div = 8) {
  if (!requireNamespace("colorspace", quietly = TRUE)) {
    stop("colorspace package is required.")
  }

  if (n < 1) stop("n must be >= 1")

  # === 色特性の初期化 ===
  if (!is.null(start)) {
    rgb_val <- grDevices::col2rgb(start) / 255
    hcl_col <- as(colorspace::RGB(rgb_val[1], rgb_val[2], rgb_val[3]), "polarLUV")
    h_start <- hcl_col@coords[3] %% 360
    c_val <- sqrt(sum(hcl_col@coords[2:3]^2))
    l_val <- hcl_col@coords[1]
  } else {
    h_start <- 15
    c_val <- 100
    l_val <- 65
  }

  # === Hue の分割 ===  
  if (is.null(div)) div <- 8
  base_hues <- (h_start + seq(0, length.out = div, by = 360 / div)) %% 360

  # === インデックスの並べ替え（指定の順序）===
  if (div %% 2 == 1) {
    # 奇数：1, mid+1, 2, mid+2, ...
    mid <- floor(div / 2)
    idx <- as.vector(rbind(1:mid, (mid + 1 + 1):div))
    idx <- idx[!is.na(idx)]
  } else {
    # 偶数：1, div/2+1, 2, div/2+2, ...
    half <- div / 2
    idx <- as.vector(rbind(1:half, (half + 1):div))
    idx <- idx[!is.na(idx)]
  }

  if (div == 1 ) {
    ordered_base_hues <- base_hues[1]
  } else {
    ordered_base_hues <- base_hues[idx]
  }

  palette <- as.vector(grDevices::hcl(h = ordered_base_hues, c = c_val, l = l_val))
  
  return(rep(palette, length.out = n))
}
