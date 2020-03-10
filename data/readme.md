# Notes on data

## Overview 

The trimmed data used in the analyses is provided in both RData and csv formats. The RData file is somewhat preferable as it preserves variable types and factor levels. However, a csv version is also included in order to increase interoperability and accessibility. Due to its size (>130 MB), the csv file is compressed within a zip file. 

## Trimmed data files

### RData files

RData files can be opened in R/RStudio simply by double clicking them. Or, if using the analysis.Rmd R markdown script also included in this project, simply place the RData and analysis.Rmd files in "data" and "analysis" folders within the same folder. ie:

~/hidden_invalidity_materials/data/trimmed_data.Rdata
~/hidden_invalidity_materials/analysis/analysis.Rmd

When the Rmd code is run, it will then find the data file and load it itself (i.e., using:

>load("../data/trimmed_data.RData")

Of course, you can alter this folder structure if you wish by changing the code as you wish.

### csv files

The zip file can be decompressed using any common compression tool built into most operating systems. 

The column separator used is a comma (i.e., ","). Empty cells are designed with "NA".

## Original data files

The trimmed data files represent a subset from the full AIID dataset (https://osf.io/pcjwf/). The R code containing the logic of this subsetting is included here (see processing.Rmd file). The full AIID dataset is not available, as it is being used for a virtual special issue of Registered Reports across multiple journals. However, an "exploratory" 15% stratified subset is available (see the OSF page), and much larger confirmatory subset (c.5 times as large) will be available in due course after the RRs have been accepted. 

## Additional information on the scales

The additional_scale_data.csv file contains additional information about the scales used in the study, including the interpretation of high vs low scores, and changes to the scales relative to their originally published versions. Full details of all the scales items, as well as all code for the  implementation of the AIID study and the processing and validation of the AIID dataset are available on AIID OSF page (https://osf.io/pcjwf/).

## Copyright

The AIID dataset is released under a Creative Commons Zero license (CCO; public domain, see https://creativecommons.org/publicdomain/zero/1.0/). This means that you can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission. 

