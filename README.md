# PHA-accumulating Methanotrophs from Freshwater Wetlands
Data and analysis code for the manuscript "Resource availability governs Polyhydroxyalkanoate Accumulation and Diversity of Methanotrophic Enrichments from Wetlands" by Yujin Kim, Zachary Flinkstrom, Pieter Candry, Mari Winkler, Jaewook Myung.

## Image Analysis
* `Image_analysis/imageJ_scripts` contains ImageJ Macro scripts for processing the raw multichannel microscopic images (which can be downloaded as a zip file from the manuscript)
* `Image_analysis/PHB_percent_analysis.ipynb` contains python code for processing and plotting the outputs from the ImageJ macros
* `Image_analysis/data-high-phb`contains single cell PHB % area data for the high resource enrichments output from ImageJ
* `Image_analysis/data-high-sybr`contains Sybr green cell count data for the high resource enrichments output from ImageJ
* `Image_analysis/data-low`contains Sybr green cell count and PHB granule count data for the low resource enrichments output from ImageJ
* `Image_analysis/figure` contains figures output from the python notebook
* `Image_analysis/output` contains summary data tables output from the python notebook

## 16S rRNA Sequencing Analysis
* `16S_sequencing/usearch_pipeline.ipynb` contains usearch commands and output used for processing raw sequencing data (which can be accessed from ncbi Bioproject: https://www.ncbi.nlm.nih.gov/bioproject/PRJNA954053)
  * Note: because the raw sequencing reads are not hosted in this repository, the file paths in the usearch commands will need to be checked before running in your local environment
* `16S_sequencing/16S_data_plotting.ipynb` contains python code for processing and plotting 16S rRNA sequencing data
* `16S_sequencing/data` contains zero-radius OTU (ZOTU) count and taxonomy data output from usearch used for plotting
* `16S_sequencing/figures`contains taxonomy bar plots, alpha-diversity, and beta-diversity figures ouput from the data plotting notebook 
* `16S_sequencing/output` contains normalized ZOTU table data combined with taxonomy for all samaples
