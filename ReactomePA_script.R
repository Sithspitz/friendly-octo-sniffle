# Install and load required packages:

if (!requireNamespace("devtools", quietly = T))
  install.packages("devtools")
  library("devtools")

if (!requireNamespace("urltools", quietly - T))
  install.packages("urltools")
  library("urltools")


# Install ReactomePA from Bioconductor:

if (!requireNamespace("ReactomePA", quietly = TRUE))
   devtools::install_github(c("GuangchuangYu/DOSE", "GuangchuangYu/ReactomePA"))
