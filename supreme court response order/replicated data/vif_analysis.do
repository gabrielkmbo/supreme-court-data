//// This takes the end dataset after running response order replication.R and does the VIF analysis reported in Table A3
/// author: neil malhotra
/// date: 7/26/23
/// updated: 12/21/23
///////////////////////////////////

use vif.dta, clear

reg case2 forma words fkscore knowledge educ male_std white_std age_std pid_std nytfront_std godgaysguns_std [pweight=weight], cluster(respid)

estat vif

