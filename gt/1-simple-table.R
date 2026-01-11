################################################################################
#                                                                              #
#                               By Derrick DEMEVENG                            #
#                                                                              #
################################################################################

# LOAD LIBRARIES
if(!require("pacman")) install.packages("pacman")

pacman::p_load(
  gt,
  readxl
)

# LOAD DATA
file <- "input/GMB_indicators.xlsx"
data <- readxl::read_xlsx(file)

# DATA TRANSFORMATION


# DATA VISUALIZATION