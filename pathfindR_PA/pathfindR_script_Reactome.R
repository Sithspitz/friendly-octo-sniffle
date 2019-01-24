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

packages <- c("BiocManager", "pathview", "AnnotationDbi", "org.Hs.eg.db", "pathfindR")

lapply(packages, FUN = function(X) {
  do.call("require", list(X)) 
})

# Import Data:
## Change File Path ##

collated_TCGA_enrichment_data <- read.csv("~/R/R Local Projects/friendly-octo-sniffle/pathfindR_PA/collated_TCGA_enrichment_data.csv")

# Pathway Enrichment Analysis:
## Change File Name ##
### Change the p_val_threshold back down to an appropriate level? ###
#### search_method = SA or GA?!? ####

PEA_results <- run_pathfindR(collated_TCGA_enrichment_data, gene_sets = "Reactome", p_val_threshold = 0.7,
                             enrichment_threshold = 0.1, sig_gene_thr = 0,
                             adj_method = "BH", list_active_snw_genes = T, output_dir = "PEA_KEGG_Results")

