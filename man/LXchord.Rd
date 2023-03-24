\name{LXchord}
\alias{LXchord}
\title{LXchord::LXchord}
\usage{
LXchord(data_set)

}
\description{
Prints 'Hello, world!'.
}
\examples{
if(!requireNamespace("devtools"))
  install.packages("devtools")

library(devtools)

install_github("gluck4668/LXchord")

library(LXchord)

??LXchord

#------------------------------------
data(data_set_example)

#------------------------------------

data_set <- "LXchord_df.xlsx"

LXchord(data_set)

}
