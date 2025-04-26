

# List of required packages
packages_datacleaning <- c(
  "dplyr", "ggplot2", "ggpubr", "tidyr", "quarto", "rmarkdown",
  "devtools", "readxl", "ssh", "knitr", "kableExtra", "httpgd", "FSA", "glue"
)

packages_cluster <- c(
  "plotly", "factoextra", "ggcorrplot", "cluster", "openxlsx", "clValid",
  "Kmedians", "NbClust", "ggpubr", "glmulti", "FactoMineR", "patternize", 
  "raster", "recolorize", "tools", "grid", "plotrix", "ggforce", "htmlwidgets",
  "webshot2", "ggrepel"
)

packages_bayesian <- c(
  "bayesplot", "posterior", "gridExtra", "brms", "tibble", "kableExtra",
  "scales", "tidyverse", "grid", "patchwork", "cowplot", "loo", "extraDistr", 
  "IRdisplay", "IRkernel", "leaflet", "DT", "rstan", "StanHeaders", "ggdist"
)

packages_phylogenetic <- c(
  "ape", "BiocManager", "treeio", "TreeDist", "TreeTools", "ggtree"
)


# Combine package lists
packages <- c(packages_datacleaning, packages_cluster, packages_bayesian, packages_phylogenetic)


# Install packages
installed <- rownames(installed.packages())
missing <- packages[!packages %in% installed]
if (length(missing) > 0) {
  install.packages(missing)
}

# Install these extra packages which are finicky
if (!"ggtree" %in% installed) {
  BiocManager::install("ggtree")
}

cmdstanr::install_cmdstan(cores = 28, version = "2.32.1")

IRkernel::installspec(user = FALSE)

# Load packages
lapply(packages, library, character.only = TRUE)
