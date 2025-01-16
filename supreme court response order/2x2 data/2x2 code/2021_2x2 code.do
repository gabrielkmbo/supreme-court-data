** upload the dta **
use "/Users/grantmoore/Dropbox/src 2024/supreme court survey codebooks/cleaned survey data/supremecourtsurveydata2021_cleaned.dta"
** change depending on which cleaned survey you want to change

** weight the data **
svyset [pweight=weight]

** fix pid **
gen pid = .
replace pid = 1 if inlist(pid7, 1, 2, 3)
replace pid = 2 if pid7 == 4
replace pid = 3 if inlist(pid7, 5, 6, 7)

* generate (arbitrary) user id 
gen id = _n
keep q1a-q24b q41a-q44b pid id total_correct weight

order id pid q1a q1b q2a q2b q3a q3b q4a q4b q5a q5b q6a q6b q7a q7b q8a q8b q9a q9b q10a q10b q11a q11b q12a q12b q13a q13b q14a q14b q15a q15b q16a q16b q17a q17b q18a q18b q19a q19b q20a q20b q21a q21b q22a q22b q23a q23b q24a q24b q41a q41b q42a q42b q43a q43b q44a q44b total_correct
// q25a q25b q26a q26b q27a q27b q28a q28b q29a q29b q30a q30b q31a q31b q32a q32b q33a q33b q34a q34b

* rename the questions
forvalues i = 1/24 {
    rename q`i'a qa`i'
    rename q`i'b qb`i'
}
forvalues i = 41/44 {
    rename q`i'a qa`i'
    rename q`i'b qb`i'
}

* reshape
reshape long qa qb, i(id) j(question)
egen q_response = rowmax(qa qb)

gen per_response = .
gen court_response = .

* Populate per_response and court_response based on question number
bysort id: replace per_response = q_response if mod(question, 2) == 1
bysort id: replace court_response = q_response if mod(question, 2) == 0
sort id question
by id: replace court_response = court_response[_n+1]

* Remove rows with even-numbered questions to keep only rows where per_response is populated
keep if mod(question, 2) == 1
rename question per_q
gen court_q = per_q + 1
drop qa qb q_response
gen case_q_order = court_q / 2
order id pid per_q court_q per_response court_response case_q_order total_correct weight

tab per_response court_response, cell nofreq chi2

** save in new folder **
save "/Users/grantmoore/Dropbox/src 2024/supreme court response order/2x2 data/reshaped_2021.dta", replace

** generate partisnship column **
gen per_ideo = .
gen court_ideo = .

** Find number of questions **
egen tag = tag(per_q)
quietly count if tag
local num_questions = r(N)
drop tag

** Count total number of dems and republicans, storing them into variables **
quietly count if pid == 1
local demo = r(N)
local dem = `demo' / `num_questions'
display "Total Democrats: `dem'"

quietly count if pid == 3
local repub = r(N)
local rep = `repub' / `num_questions'
display "Total Republicans: `rep'"

** Loop over all questions **
forvalues q = 1(2)44 {
    * Count responses for pid == 1 and pid == 3
    quietly count if per_q == `q' & pid == 1 & per_response == 1
    local response1 = r(N)
	local count1 = `response1' / `dem'

    quietly count if per_q == `q' & pid == 3 & per_response == 1
    local response2 = r(N)
	local count2 = `response2' / `rep'
	
	if `count1' >= `count2' {
		replace per_ideo = 1 if per_q == `q' & per_response == 1
		replace per_ideo = 2 if per_q == `q' & per_response == 2
		
	}
	if `count1' < `count2' {
		replace per_ideo = 2 if per_q == `q' & per_response == 1
		replace per_ideo = 1 if per_q == `q' & per_response == 2
	}	
}

forvalues q = 2(2)44 {
    * Count responses for pid == 1 and pid == 3
    quietly count if court_q == `q' & pid == 1 & court_response == 1
    local response1 = r(N)
	local count1 = `response1' / `dem'

    quietly count if court_q == `q' & pid == 3 & court_response == 1
    local response2 = r(N)
	local count2 = `response2' / `rep'
	
	if `count1' >= `count2' {
		replace court_ideo = 1 if court_q == `q' & court_response == 1
		replace court_ideo = 2 if court_q == `q' & court_response == 2
		
	}
	if `count1' < `count2' {
		replace court_ideo = 2 if court_q == `q' & court_response == 1
		replace court_ideo = 1 if court_q == `q' & court_response == 2
	}	
}


** labeling the partisanship ** 
label define partisanship_label 1 "liberal" 2 "conservative"
label values per_ideo partisanship_label
label values court_ideo partisanship_label

** reorder **
order id pid per_q court_q per_response court_response per_ideo court_ideo case_q_order total_correct weight

** clarify the year **
gen year = 2021

** Fixes numbering of cases that were off due to odd ordering in survey **
replace case_q_order = 13 if case_q_order == 21
replace case_q_order = 14 if case_q_order == 22

** Generate column for court_rule **
gen court_rule = .

// Hard coding of SCOTUS decisions (from "2021-SCOTUSpoll-withideal-and-perceptions_statafriendly")
// The variable from above doc is commented to the right of each case. court_rule = x defines how SCOTUS ruled

replace court_rule = 2 if case_q_order == 1 
//gayadoption_scotus
replace court_rule = 2 if case_q_order == 4 
//azprovballot_scotus
replace court_rule = 2 if case_q_order == 5 
//azcollectballot_scotus
replace court_rule = 1 if case_q_order == 6 
//donors_scotus
replace court_rule = 2 if case_q_order == 7 
//schoolspeech_scotus
replace court_rule = 2 if case_q_order == 8 
//juvcrime_scotus
replace court_rule = 2 if case_q_order == 9 
//databases_scotus
replace court_rule = 2 if case_q_order == 10 
//ncaa_scotus
replace court_rule = 1 if case_q_order == 11 
//covidchurch_scotus
replace court_rule = 2 if case_q_order == 12 
//unions_scotus
replace court_rule = 1 if case_q_order == 13 
//agencies_scotus
replace court_rule = 2 if case_q_order == 14 
//warrants_scotus

tab per_ideo court_ideo, cell
tab per_ideo court_ideo, cell nofreq chi2
save "/Users/grantmoore/Dropbox/src 2024/supreme court response order/2x2 data/reshaped_2021.dta", replace
