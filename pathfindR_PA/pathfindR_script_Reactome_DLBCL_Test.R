# Install Bioconductor Packages:

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("pathview", version = "3.8")
BiocManager::install("AnnotationDbi", version = "3.8")
BiocManager::install("org.Hs.eg.db", version = "3.8")

# Install pathfindR:

if (!requireNamespace("pathfindR", quietly = TRUE))
  install.packages("pathfindR")

# Load Packages:

packages <- c("BiocManager", "pathview", "AnnotationDbi", "org.Hs.eg.db", "pathfindR", "RGraphics", "grDevices", "ggplot2")

lapply(packages, FUN = function(X) {
  do.call("require", list(X)) 
})

# Import Data:
## Change File Path ##

DLBCL_test <- read.csv("~/R/R Local Projects/friendly-octo-sniffle/pathfindR_PA/DLBCL_test.csv")

# Pathway Enrichment Analysis:
## Change File Name ##
### Change the p_val_threshold back down to an appropriate level? ###
#### search_method = SA or GA?!? ####

PEA_results <- run_pathfindR(DLBCL_test, gene_sets = "Reactome", p_val_threshold = 0.7,
                             enrichment_threshold = 0.1, sig_gene_thr = 0,
                             adj_method = "BH", list_active_snw_genes = T, output_dir = "PEA_DLBCL_test")

## Error: Error in grDevices::png(paste0("pathway_visualizations/", current_row$Pathway,  : 
## unable to start png() device
## In addition: Warning messages:
##  1: In pathfindR::input_processing(input, p_val_threshold, pin_path,  :
##                                      The gene column was turned into character from factor.
##                                    2: In grDevices::png(paste0("pathway_visualizations/", current_row$Pathway,  :
##                                                                  unable to open file 'pathway_visualizations/CDT1 association with the CDC6:ORC:origin complex.png' for writing
##                                                                3: In grDevices::png(paste0("pathway_visualizations/", current_row$Pathway,  :
##                                                                                              opening device failed