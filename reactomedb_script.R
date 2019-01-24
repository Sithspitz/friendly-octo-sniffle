# Install reactome.db from Bioconductor:

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("reactome.db", version = "3.8")

## Not finishing at the moment trying pathfindR again