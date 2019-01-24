# Load required base packages:

library("devtools")
library("urltools")

# Install ReactomePA from GitHub:

if (!requireNamespace("ReactomePA", quietly = TRUE))
   devtools::install_github(c("GuangchuangYu/DOSE", "GuangchuangYu/ReactomePA"))

# Install clusterProfiler:

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("clusterProfiler", version = "3.8")

# Load ReactomePA and clusterProfiler:

library("ReactomePA")
library("clusterProfiler")
library("data.table")

# Import Data:
## Change Filepath if needed

pre_collated_TCGA_enrichment_data <- read.csv("~/R/R Local Projects/friendly-octo-sniffle/pathfindR_PA/collated_TCGA_enrichment_data.csv")

# Convert Gene ID Symbol to Entrez Gene ID:

df1 <- pre_collated_TCGA_enrichment_data[,1, drop = F]
df2 <- transpose(df1)
df3 <- bitr(df2, 
                             fromType = "SYMBOL", OrgDb = "org.Hs.eg.db", 
                             toType = "ENTREZID")
df4 <- df3[,2, drop = F]
df5 <- transpose(df4)
entrez_TCGA_enriched <- as.numeric(as.character(df5))


data(entrez_TCGA_enriched)
de <- names(entrez_TCGA_enriched)[abs(entrez_TCGA_enriched) > 1.5]
head(de)

outputUT <- enrichPathway(entrez_TCGA_enriched, pvalueCutoff = 0.1,
                        pAdjustMethod = "BH", readable = T)
head(as.data.frame(outputUT))

### Not finished as not sure ReactomePA will give good results
#### Going to try with reactome.db package
