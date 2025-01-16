README for Replication Materials for "Asking About Complex Policies" (Jessee, Malhotra and Sen)

Email sjessee@utexas.edu with any questions.

All data and code files should be saved in the same directory for replication. Most analyses were run in R, but some were run in Stata. 

The following R packages are required to run the code: rio, estimatr, ggplot2, ggeffects, sandwich, lmtest, pscl, lme4, foreign

The R code file "response order replication.R" produces all tables and figures for the main paper and appendix *except* for those listed below, which are produced by other code files.

responseorder_pidbenchmarking.do - produces party ID benchmarking results mentioned footnote 8 and footnote 11 of the paper

responseorder_majoritybenchmarking.do - produces "would inference about the majority?" benchmarking results mentioned footnote 8 and footnote 11 of the paper

vif_analysis.do - produces Appendix Table A3 results, which give assessment of potential multicollinearity
