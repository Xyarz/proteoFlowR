
# Package Installation ----------------------------------------------------

# install.packages("ggforce")
# install.packages("extrafont")
# install.packages("ConfidenceEllipse")
# install.packages("ggsci")
# install.packages("ComplexUpset")
# install.packages("factoextra")
# install.packages("Cairo")
# install.packages("geneset", dependencies = TRUE)
# install.packages("genekitr", dependencies = TRUE)
# BiocManager::install("clusterProfiler")
# BiocManager::install("rrvgo")


# Libraries ---------------------------------------------------------------

library(ggplot2)
library(ggtext)
library(ggforce)
library(ggalt)
library(pheatmap)
library(tidyverse)
library(cowplot)
library(ggfortify)
library(markdown)
library(RColorBrewer)
library(ggrepel)
library(dplyr)
library(gridExtra)
library(extrafont)
library(MSnSet.utils)
library(ConfidenceEllipse)
library(ggsci)
library(scales)
library(ComplexHeatmap)
library(circlize)
library(ComplexUpset)
library(factoextra)
library(Cairo)
library(geneset)
library(genekitr)
library(rrvgo)
library(patchwork)


# Font Setup --------------------------------------------------------------

# Load fonts
loadfonts(device = "win")
fonts()


# paths -------------------------------------------------------------------

c_path <- ""

# helper functions --------------------------------------------------------

source("refactor/helper_functions.R")

