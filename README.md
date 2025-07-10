# CompColor

## English

### Overview

CompColor is an R package that automatically generates color palettes for categorical data, compatible with ggplot2.
Instead of arranging colors by hue order, it improves visibility by alternating between perceptually distant hues.

Note that CompColor is not optimized for color vision deficiency, so for basic visibility and accessibility, palettes such as those provided by RColorBrewer[[https://r-graph-gallery.com/38-rcolorbrewers-palettes.html]] may be more suitable.

However, CompColor is designed for use cases that require many distinct colors, and therefore it has no practical limit on the number of colors in a palette.
Features

### Features
- Maintains perceptual smoothness by using the HCL color space
- Allows specification of the number of divisions, selecting colors as if placing vertices of an n-pointed star on the hue circle
- When the number of required colors exceeds the palette size, colors are automatically recycled
- A starting color can be specified, from which chroma and luminance are inherited, and only hue is varied to generate the palette

### Installation

```r
# Install directly from GitHub
library(devtools)
devtools::install_github("sasamori0619/CompColor")
```

### Usage

Default.

```r
library(ggplot2)
library(compcolor)

ggplot(mpg, aes(x = class, fill = class)) +
  geom_bar() +
  scale_fill_comp()
```

<img width="972" height="522" alt="default" src="https://github.com/user-attachments/assets/fbd14c9e-1605-4d89-8f29-bb309f876c11" />

Specify the number of hue ring divisions and recycle the color pallet.

```r
ggplot(mpg, aes(x = class, color = class)) +
  geom_bar() +
  scale_fill_comp(div=4)
```

<img width="972" height="522" alt="div4" src="https://github.com/user-attachments/assets/fc40a5f5-f944-4971-b886-34611566a9a5" />

Specify the starting color of pallet by color cord.

```r
ggplot(mpg, aes(x = class, fill = class, color = class)) +
  geom_bar() +
  scale_fill_comp(start="#aadceb") +
  scale_color_comp(start="#ce3a62")
```
<img width="972" height="429" alt="test" src="https://github.com/user-attachments/assets/bd7a8e34-2ff7-441e-9229-a74df0dd0f8a" />


---

## 日本語

### 概要
**`CompColor`** は、ggplot2に対応したカテゴリ用カラーパレットを自動生成するRパッケージです。  
色相順ではなく、**色相の離れた色を交互に配置することで見やすさを向上**させています。

色覚多様性への配慮はされていないため、基本的な視認性はRColorBrewer[[https://r-graph-gallery.com/38-rcolorbrewers-palettes.html]]などほうが優れています。
一方CompColorは多色のカラーパレットを運用する場合を想定して作成したパッケージであり、実質的な色数の制約がありません。

### 特徴

- HCL色空間で自然な色のトーンを維持
- 分割数を指定することができ、分割数に応じて色相環から色を取得（色相環の上にn個の頂点を持つ星を描くように色を取得）
- 要求色数がパレット色数（分割数）を超えた場合はパレットの色指定が繰り返される
- 始点となる色を指定することができ、明度・彩度を継承しながら色相のみを変えたパレットを生成

### インストール

```r
# GitHubから直接インストール
library(devtools)
devtools::install_github("sasamori0619/CompColor")
```

### Usage

デフォルト

```r
library(ggplot2)
library(compcolor)

ggplot(mpg, aes(x = class, fill = class)) +
  geom_bar() +
  scale_fill_comp()
```

<img width="972" height="522" alt="default" src="https://github.com/user-attachments/assets/fbd14c9e-1605-4d89-8f29-bb309f876c11" />

色相環の分割数を指定し、カラーパレットを繰り返し使用

```r
ggplot(mpg, aes(x = class, fill = class)) +
  geom_bar() +
  scale_fill_comp(div=4)
```

<img width="972" height="522" alt="div4" src="https://github.com/user-attachments/assets/fc40a5f5-f944-4971-b886-34611566a9a5" />

カラーパレットのはじめの色をカラーコードで指定

```r
ggplot(mpg, aes(x = class, fill = class, color = class)) +
  geom_bar() +
  scale_fill_comp(start="#aadceb") +
  scale_color_comp(start="#ce3a62")
```
<img width="972" height="429" alt="test" src="https://github.com/user-attachments/assets/bd7a8e34-2ff7-441e-9229-a74df0dd0f8a" />
<img width="972" height="522" alt="start" src="https://github.com/user-attachments/assets/b2035b29-fb69-41df-8e4d-e29f7a4dc30d" />
