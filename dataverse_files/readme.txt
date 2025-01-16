## Replication materials for:
##
## A decade-long longitudinal survey 
##   shows that the Supreme Court is 
##   now much more conservative than 
##   the public
##
## by Jessee, Malhotra and Sen
##
## in Proceedings of the National 
##    Academy of Sciences


The following datasets and code files will reproduce the results of the article and supplementary information (SI). Those wanting to reproduce all parts of the results (most notably, including the credible intervals) should feel free to contact the authors for the needed additional files, which would take quite a long time to run and would create large output files.

Code files:

paper-figures.R
requires the following files to be in the same directory: "2010SCOTUSpoll.RData", "2020SCOTUSpoll.RData", "2021SCOTUSpoll.RData"
Reproduces all figures in the main article (Figs 1, 2 and 3) as well as SI figures S1, S6 and S7, and SI tables S1, S2 and S3.

small-vs-big-scalings-comparisons.R
requires the file "all-vs-small-ideol-estimates.RData" to be in the same directory
Reproduces SI figure S2

Leave-one-out-scalings.R
requires the following files to be in the same directory: "Leave one out x estimates 2010.RData", "Leave one out x estimates 2020.RData", "Leave one out x estimates 2021.RData", "2010SCOTUSpoll.RData", "2020SCOTUSpoll.RData", "2021SCOTUSpoll.RData"
Reproduces SI figures S3, S4 and S5

tables_s4_s5_s6.do
requires the following files to be in the same directory: "2010-SCOTUSpoll-withideal-and-perceptions_statafriendly.csv", "2020-SCOTUSpoll-withideal-and-perceptions_statafriendly.csv", "2021-SCOTUSpoll-withideal-and-perceptions_statafriendly.csv"
Reproduces SI tables S4, S5, and S6

codebook.csv
codebook with variables names, descriptions, and codes