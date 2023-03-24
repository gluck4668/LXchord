
#setwd("D:/Desktop/R包开发/LXDESeq")
library(openxlsx)

data_set_example <- read.xlsx("LXchord_df.xlsx")

usethis::use_data(data_set_example,overwrite = T)

rm(list=ls())

data(data_set_example)


