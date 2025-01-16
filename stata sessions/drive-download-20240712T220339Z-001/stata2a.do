* Stata Day 2, July 12, 2024

* this is one way to make a comment
// this is another way to make a comment
/* here is yet another way to write a comment */

*****************
* Preliminaries *
*****************

version 18 // Specify the version. (Stata offers "version control")
clear      // Clear the memory


*********************
* Running a do-file *
*********************

* let's run all our work from yesterday
do stata1   // runs all the commands in stata1.do


********************
* Loading datasets *
********************

capture log close            // closes a log if it's open
log using Stata2, replace    // open a log file
clear                  // clear memory
use tomzsurvey         // load tomzsurvey.dta (which is in Stata format)
use tomzsurvey, clear  // combines the previous two commands
describe               // describes contents

import excel tomzsurvey.xlsx, firstrow clear // import Excel. First row has var names
import excel tomzsurvey.xlsx, firstrow clear sheet("tomzsurvey") // specify which sheet to read
import delimited using tomzsurvey.csv, clear // load comma-separated file
import delimited using tomzsurvey.tab, clear // load tab-delimited file
cf _all using tomzsurvey.dta  // compare current version to Stata version


**********************************
* Merging and appending datasets *
**********************************

* merge datasets
describe using tomzsurvey-right // describe contents of right-side dataset
describe using tomzsurvey-left // describe contents of left-side dttaset
use tomzsurvey-left, clear     // load the "left-side" dataset
merge 1:1 id using tomzsurvey-right // merge left with right based on "id"
describe                       // describe the new dataset (full set of vars)

* merge with missing data
use tomzsurvey-rightmiss, clear // load dataset with missing respondents
summarize                       // summarize dataset with missing respondents
use tomzsurvey-left, clear      // load the "left-side" dataset
merge 1:1 id using tomzsurvey-rightmiss // merge with right that has missing dta
summarize                    // summarize the new dataset (some missing vals)

* appending data
describe using tomzsurvey-top // describe "top" portion of the dataset (N=600)
describe using tomzsurvey-bottom // describe "bottom" portion of the dataset
use tomzsurvey-top, clear    // load the "top" portion of the dataset
append using tomzsurvey-bottom // append the bottom portion of the dataset
describe                     // describe the new dataset (now N = 1,191)

* appending data with extra variables
describe using tomzsurvey-bottom-extra  // describe dataset with extra vars
use tomzsurvey-top, clear    // load the top again
append using tomzsurvey-bottom-extra // append the bottom, with extra vars
summarize                    // summarize the new dataset

*******************************
* Preparing data for analysis *
*******************************

use tomzsurvey, clear          // load the dataset
summarize                      // summarize vars
codebook, compact              // display a codebook
label list                     // list value labels and their contents

* generate new variables
generate three = 3              // generate a variable filled with "3"
generate pi = _pi               // generate a variable filled with pi
generate sequence = _n          // generate sequence 1,2,3,...,N
generate decades = age/10       // generate a new variable, age in decades
drop three pi sequence decades  // clean up our mess     

* cloning versus copying
tabulate party                  // existing party variable
clonevar party_clone = party    // clones party, including its value labels
tabulate party_clone
generate party_num = party      // copies party without its value labels
tabulate party_num

* Make an indicator (dummy) variable for Republicans
rename party_num repub         // rename a variable
recode repub 3=1 1=0 2=0       // recodes 3 to be 1, recodes 1 and 2 to be 0
tabulate party repub           // cross-tabulate to check accuracy

* More efficient way to make an indicator variable for Republicans
recode party 3=1 1=0 2=0, gen(repub_v2)  // more efficient method
tabulate party repub_v2        // cross-tabulate to check accuracy

* labels for our new variable
label var repub "Is respondent Republican?"          // label the variable
label define repub_label 1 "Republican" 0 "Non-Repub" // define a value label
label values repub repub_label                        // assign the value label
tabulate repub                                        // tab, showing labels
tabulate repub, nolabel                               // tab, suppress labels
drop party_clone repub repub_v2                       // clean up our mess

* extensions to generate: make a new categorical variable
egen age_cat = cut(age), group(3)  // split the sample in to three groups
tabulate age_cat
bysort age_cat: summarize age

/*
* extensions to generate: create standardized values
egen age_std = std(age)       // standardize age 
summarize age_std
hist age_std, percent normal  // histogram, superimpose a normal curve
*/

* dealing with missing values
use tomzsurvey-mvs, clear  // load a version with missing values
describe
summarize
tabulate age
mvdecode age, mv(-88 -99)  // change -88 and -99 to missing
tabulate age               // tabulate, suppressing missing values
tabulate age, miss         // tabulate, showing missing values
mvencode age, mv(-999)     // change missing to -999
tabulate age               // tabulate, showing the -999's

* creating numeric variables when #s were stored as strings
codebook male              // numbers were stored as strings
destring male, replace     // convert them to numeric
codebook male              // confirm the change

* create a numeric variable based on text in an another string variable
codebook partyname
generate party = .         // initialize to missing
replace party = 1 if partyname == "Democrat"
replace party = 2 if partyname == "Independent"
replace party = 3 if partyname == "Republican"
label define party_label 1 "Democrat" 2 "Independent" 3 "Republican"
label values party party_label
codebook party

tabulate partyname, gen(party)  // generates dummy variables party1, party2...
describe
rename party1 dem
rename party2 ind
rename party3 rep
summarize dem ind rep

compress                      // save space
save my_new_data, replace     // save my_new_data, overwriting existing
export excel using my_new_data, firstrow(variables) nolabel replace // to excel
export delimited using my_new_data, nolabel replace  // export as delimited

*****************
* Means and CIs *
*****************

* find the mean level of support for the tea party
use tomzsurvey, clear   // load data
codebook tea            // codebook for "tea" variable
summarize tea           // find mean of this binary variable

* But the mean is uncertain.
* Let's get SE's and 95% confidence intervals

* One common method: normal approximation, in which the
* 95% CI is approximately equal to the mean +/- 1.96*SE
mean tea               // mean with SE and 95% CI (normal approximation)
di .4721931/sqrt(1191) // SE is standard deviation divided by sqrt(N)
ci mean tea            // another command that gives same information
display "Lower bound: " .3350126 - 1.96*.0136824  // approximate CI by hand
display "Upper bound: " .3350126 + 1.96*.0136824  

* change the confidence level
ci mean tea, level(99)  // report 99% CI
ci mean tea, level(90)  // report 90% CI

* Normal CI's could be nonsensical or misleading
* Example: Small sample of rare event
tab educ
recode educ 1=1 2/4=0 *=., gen(less_than_hs) // dummy var for less than HS
keep in 1/50            // keep the first 50 observations
mean less_than_hs       // now the 95% CI doesn't make sense

* Alternative methods that respect the [0,1] bounds: exact CI, boootstrap
ci prop less_than_hs    // exact 95% CI for a proportion
bootstrap, reps(1000) seed(54321): mean less_than_hs // boostrap mean and CI
estat bootstrap, all    // report various types of confidence intervals

**********************************
* T-test for difference in means *
**********************************

* Test for equality of means
use tomzsurvey, clear               // reload the dataset
generate female = 1 - male          // new variable: 1 if female, 0 if male
ttest tea, by(female)               // t-test male v female suppt for tea party

/*
* To visualize, let's simulate a t distribution (similar to normal distrib)
set seed 67891                                 // set seed for replicability
generate random_t = rt(1189)                   // random draws from t, 1189 d.f.
histogram random_t, xline(1.9670) fcolor(%30)  // vertical line for t stat
gen onetail = random_t >= 1.9670               // 1 if draw is in upper tail, 0 otherwise
gen twotail = abs(random_t) >= 1.9670          // 1 if draw is in upper or lower tail, 0 otherwise
su twotail onetail                             // proportion of draws in those regions
drop random_t twotail onetail                  // clean up
*/

************************************************************************
* Crosstabulation to test for association between 2 discrete variables *
************************************************************************

* Test for relationship between discrete variables
tabulate female tea, all         // cross-tabulate and compute chi-square stat

/*
* Let's calculate the chi2 statistic by hand
tabulate female tea, expected  // expected cell counts
di (377-393)^2/393 + (214-198)^2/198 + (415-399)^2/399 + (185-201)^2/201 // chi2

* To vizualize, let's simulate the chi-squared distribution
set seed 12345
generate random_chi2 = rchi2(1)                   // random draws from chi2(1)
histogram random_chi2, fraction xlabel(0(1)12) xline(3.8632) fcolor(%30)
gen tail = random_chi2 >= 3.8632  // 1 if draw is in upper tail, 0 otherwise
su tail                           // proportion of draws in the upper tail
drop random_chi2 tail             // clean up
*/

****************************************
* Mean within each of three categories *
****************************************

* find mean and standard deviation of tea, by party ID
bysort party: su tea              // one method
tabulate party, summarize(tea)    // another method
tabstat tea, s(mean sd) by(party) // another method

* Now let's add SE's and confidence intervals
mean tea, over(party)      // gives normal approximation to CI
bysort party: ci mean tea  // gives normal approximation to CI
bysort party: ci prop tea  // gives exact binomial CI

****************************************
* Crosstabulation to produce 3x2 table *
****************************************

tab party tea           // raw counts
tab party tea, row      // gives row percentages (same as cond mean)
tab party tea, col      // gives col percentages
tab party tea, all      // gives test statistics
tab party tea, all row  // gives test stats and row percentages

************************
* Bivariate Regression *
************************

use anscombe, clear
describe  // discuss # of observations, notes, etc.

* run the regression
regress y1 x1

* scatterplot (also illustrate the use of globals)
scatter y1 x1
global options xlabel(0(4)20, grid) ylabel(0(4)14, grid angle(horiz)) ///
   scheme(s2mono) xtitle(X) ytitle(Y) plotregion(margin(0 0 0 0)) ///
   legend(off) // illustate global macros and line wrapping
display "$options" // display the contents of the global
scatter y1 x1, $options   // draw the graph using the global options

/*
* scatterplot (also illustrate the use of locals )
local options xlabel(0(4)20, grid) ylabel(0(4)14, grid angle(horiz)) /// 
   scheme(s2mono) xtitle(X) ytitle(Y) plotregion(margin(0 0 0 0)) ///
   legend(off)  // illustate local macros and line wrapping
display "`options'"  // display the contents of the local
scatter y1 x1, `options'  // draw the graph using the local options
*/

* graph fitted values, without and with extrapolation
twoway (scatter y1 x1) (lfit y1 x1, lpattern(solid)), $options
twoway (scatter y1 x1) (lfit y1 x1, lpattern(solid) range(0 20)) , $options

* Plot Anscombe's quartet
twoway (scatter y1 x1) (lfit y1 x1, lpattern(solid) range(0 20)), ///
   $options name(g1, replace) nodraw
twoway (scatter y2 x2) (lfit y2 x2, lpattern(solid) range(0 20)), ///
   $options name(g2, replace) nodraw
twoway (scatter y3 x3) (lfit y3 x3, lpattern(solid) range(0 20)), ///
   $options name(g3, replace) nodraw
twoway (scatter y4 x4) (lfit y4 x4, lpattern(solid) range(0 20)), ///
   $options name(g4, replace) nodraw
graph combine g1 g2 g3 g4


**************************************************
* MULTIVARIATE REGRESSION USING THE AUTO DATASET *
**************************************************

sysuse auto, clear  // load the auto dataset
describe            // describe the variables
summarize           // summarize the variables

* Scatterplots
scatter mpg weight
scatter mpg length
scatter mpg gear_ratio
scatter mpg displacement
graph matrix mpg weight length gear_ratio displacement

* Example 1
reg mpg weight // bivariate regression
twoway (scatter mpg weight) (lfit mpg weight)
reg mpg length // bivariate regression
twoway (scatter mpg length) (lfit mpg length)
reg mpg weight length // include both

* Example 2
reg mpg gear_ratio    // bivariate
twoway (scatter mpg gear_ratio) (lfit mpg gear_ratio)
reg mpg displacement  // bivariate
twoway (scatter mpg displacement) (lfit mpg displacement)
reg mpg gear_ratio displacement // include both

* Include all four variables
reg mpg weight length gear_ratio displacement // four explanatory variables
test length gear_ratio displacement // test hypothesis of joint insignificance

log close

exit


