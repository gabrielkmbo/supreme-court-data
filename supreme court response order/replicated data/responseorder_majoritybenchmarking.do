/////////////////////////////////////////////////
//// Code to assess whether response order affects inferences about majority support position
//// will look at full sample of respondents/cases along with subset of low knowledge people / lengthy questions
//// author: neil malhotra
//// date: 7/26/23
/// updated: 12/21/23
////////////////////////////////////////////////

///// Load data and do some basic editing of data and variable creation



use responseorder_fullmerge.dta, clear

merge m:1 cid using casemetadata.dta

drop if wave==1
drop if personal==0
drop if cid==75|cid==76

gen case2 = case-1

//recode nytfront (.=1)


gen educ2 = (educ-1)/5
gen white = race==1
gen male = gender==1
gen age = (age4-1)/3
gen total_correct2 = total_correct/6
gen total_correct2rev = (total_correct-6)/-6


gen pid7b = pid7
recode pid7b (8=4)
gen pid7b2 = (pid7b-1)/6

////////////////////////////////////////////////////

/// Full sample of cases

/// clean up caseids so they are sequential

gen cid_alt = .

local a=1
forvalues i = 21(2)73 {
recode cid_alt (.=`a') if cid==`i'
local ++a
}

recode cid_alt (.=28) if cid==77

local a=29
forvalues i = 79(2)101 {
recode cid_alt (.=`a') if cid==`i'
local ++a
}

/// produce results matrix

mat results = J(40,2,0)

local a=1
forvalues i = 1(1)40 {
qui reg case2 forma if cid_alt==`i' [pweight=weight], cluster(respid)
qui lincom _cons
mat results[`a',1] = r(estimate)
qui lincom _cons + forma
mat results[`a',2] = r(estimate)
local ++a
}

mat2txt, matrix(results) saving(majorityanalysisfull) replace

/// This text file lists the 40 cases, and the percent selecting a given response option in Form A and Form B. We count 7 cases where the two numbers straddle 50%, indicating that the inference about majority support depends on the response order

/// Only look at lengthy cases and low knowledge respondents

/// clean up caseids so they are sequential

tab cid if wordsa>96 /// list of the top 20 cases by length (median word length: 96 words)

gen cid_alt2 = .

local a =1
foreach i in 35 39 45 47 51 53 55 59 61 69 71 77 79 81 85 87 93 97 99 101 {
recode cid_alt2 (.=`a') if cid==`i'
local ++a
}

/// produce results matrix

mat results = J(20,2,0)

local a=1
forvalues i = 1(1)20 {
qui reg case2 forma [pweight=weight] if cid_alt2==`i'&total_correct<4&wordsa>96, cluster(respid)
qui lincom _cons
mat results[`a',1] = r(estimate)
qui lincom _cons + forma
mat results[`a',2] = r(estimate)
local ++a
}

mat2txt, matrix(results) saving(majorityanalysissubset) replace

/// This text file lists the 20 cases, and the percent selecting a given response option in Form A and Form B. We count 11 cases where the two numbers straddle 50%, indicating that the inference about majority support depends on the response order








