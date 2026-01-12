################################################################################
#                                                                              #
#                               By Derrick DEMEVENG                            #
#                                                                              #
################################################################################

# LOAD LIBRARIES
if(!require("pacman")) install.packages("pacman")

pacman::p_load(
  gt,
  readxl,
  tidyverse
)

# LOAD DATA
file <- "input/GMB_indicators.xlsx"
data <- readxl::read_xlsx(file)

# DATA TRANSFORMATION
data_trans <- data |>
  dplyr::select(
    admin.name,
    year,
    total.pop,
    pop.exposed,
    perc.pop.exposed
  ) |>
  tidyr::pivot_longer(
    cols = c(total.pop, pop.exposed, perc.pop.exposed),
    names_to = "Statistic"
  ) |>
  tidyr::pivot_wider(
    names_from = c(year),
    values_from = c(value)
  )

# DATA VISUALIZATION
data_trans |>
  gt::gt(rowname_col = "Statistic", groupname_col = "admin.name") |>
  gt::fmt_number(
    columns = c("2025", "2026", "2027", "2028", "2029", "2030"),
    decimals = 1
  ) |>
  gt::tab_header(
    title = "Projected Population Exposure by Region (2025–2030)",
    subtitle = "Total population, exposed population, and percentage exposed"
  ) |>
  gt::tab_stubhead(label = "Region / Statistic") |>
  gt::cols_nanoplot(
    columns = c("2025", "2026", "2027", "2028", "2029", "2030"),
    plot_type = "bar",
    autohide = FALSE,
    new_col_name = "Trend",
    new_col_label = "Trend",
    options = nanoplot_options(
      show_data_line = FALSE,
      show_data_area = FALSE,
      data_bar_stroke_color = "transparent",
      data_bar_fill_color = c("brown", "gold", "purple", "green")
    )
  ) 


