# Install Bioconductor Packages:

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("pathview", version = "3.8")
BiocManager::install("AnnotationDbi", version = "3.8")
BiocManager::install("org.Hs.eg.db", version = "3.8")

# Install pathfindR:

if (!requireNamespace("pathfindR", quietly = TRUE))
  install.packages("pathfindR")

